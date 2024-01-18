function arSetAllObservables(cond,obslog)
%OBSERVABLES Define Observables
%   Detailed explanation goes here
if ~exist('cond','var') || isempty(cond)
    cond=1;
end
if ~exist('obslog','var') || isempty(obslog)
    fprintf('No information about logging given. Logarithm of observables is drawn realisticly. \nWatch out! Logarithm of intensities can cause differences to original model. If this is not what you want, set arRealisticDesign([],false).\n')
    obslog = false;
end

global ar  %#ok<*GVMIS>


states = ar.model(1).x;  % all species names

load([fileparts(mfilename('fullpath')) filesep 'ObservableDraw.mat']);

% Are there constant states ? Throw them out.

% this is condition dependent!
xFineSimu = ar.model(1).condition(cond).xFineSimu;
idConstXSimu = [];
for i = 1:size(xFineSimu, 2)
    dataRange = range(xFineSimu(:, i));  % range of simulated dynamics
    normedDataRange = dataRange/max(xFineSimu(:, i));  % normalized range
    constTol = 1e-8;  % tolerance to decide if dynamics are considered constant
    if (abs(dataRange) < constTol || abs(normedDataRange) < constTol || ~isfinite(normedDataRange))
        idConstXSimu = [idConstXSimu i];
    end
end
xFineSimu(:,idConstXSimu) = [];
states(idConstXSimu) = [];
ns = length(states);
if ns == 0
    error('No dynamics found, just constants. Check in arSetObservables.m')
end
if ns < 5
    error('Realistic Design not trained for less than 5 dynamic species.')
end

% Draw number of all observables
randRow = randi(length(obs.obs));  % random row in obs table
nObs = round(obs.obs(randRow)*ns);  % corresp. number of observables
nObs = min(nObs, ns);  % upper bound for nObs

% Draw number and size of compounds
% In this implementation all compounds have the same length.
% This could be more realistic by also considerung compounds of different length.
% e.g. also calculate the standard deviation of compund size for each model,
% and draw the size of each compound from a normal distribution with this mean and std.
randRow = randi(length(obs.comp));  % random row in obs table
nComp = round(obs.comp(randRow)*nObs);  % corresp. number of compounds
compSize = round(obs.compadd(randRow));  % corresp. size of compounds
nComp = min(nComp, nObs);  % upper bound for nComp
compSize = min(compSize, ns);  % upper bound for compSize

% randomly draw the compound compositions
if nComp > 0
    % create idComp, a matrix where each row represents a compound.
    % The matrix entries are state indices.
    [~, idComp] = sort(rand(nComp, ns), 2);    % nComp many permutations of state indices
    idComp = idComp(:, 1:compSize);            % only keep the first compSize indices
    idComp = unique(sort(idComp, 2), 'rows');  % remove possible duplicate compounds
    if size(idComp, 1) < nComp
        % if not enough compounds (i.e. there were duplicates): draw again
        [~, idComp2] = sort(rand(nComp, ns), 2);
        idComp2 = idComp2(:, 1:compSize);
        idComp = unique([idComp; sort(idComp2, 2)], 'rows');
        if size(idComp, 1) < nComp
            % if still not enough compounds: accept and reduce nComp
            nComp = size(idComp, 1);
        end
    end
    if size(idComp, 1) > nComp
        % if too many compounds, randomly select a subset of size nComp
        idComp = idComp(randperm(size(idComp, 1), nComp), :);
    end
    % calculate the simulated dynamics of the compounds
    ycom = zeros(size(xFineSimu, 1), nComp);
    for icadd = 1:compSize
        ycom = ycom + xFineSimu(:, idComp(:, icadd));
    end
    % replace indices by state names
    statescomind = states(idComp);
end

% Draw how many variables are on log scale
if obslog
    randRow = randi(length(obs.logobs));  % random row in obs table
    pLog = obs.logobs(randRow);  % corresp. percentage of log observables
else
    pLog = 0;
end

% Draw how many variables have scale, offset and init
if pLog > 0.5
    % over 50% of observables are on log scale
    % -> draw number of scale, offset and init as if all were on log scale
    nScale = round(obs.scalog(randi(length(obs.scalog)))*nObs);
    nOffset = round(obs.offlogrel(randi(length(obs.offlogrel)))*nScale);
    nInit = round(obs.initlog(randi(length(obs.initlog)))*nObs);
else
    % less than 50% of observables are on log scale
    % -> draw number of scale, offset and init as if all were on non-log scale
    nScale = round(obs.scanonlog(randi(length(obs.scanonlog)))*nObs);
    nOffset = round(obs.offnonlogrel(randi(length(obs.offnonlogrel)))*nScale);
    nInit = round(obs.initnonlog(randi(length(obs.initnonlog)))*nObs);
end

% draw indices for different types of observables
idDirectObs = randperm(ns, nObs-nComp); % non-compound, i.e., directly observed states
directObs = states(idDirectObs);        % corresp. state names
idLog = binornd(1, pLog, nObs, 1);      % logical for log scale (1) or lin scale (0)
idScale = randperm(nObs, nScale);       % scaled observables
idOffset = idScale(randperm(nScale, nOffset));  % offset observables (subset of scaled)
idInit = randperm(nObs, nInit);         % initial values

% Get the simulated data for the drawn observables
if nComp > 0
    newSimu = [xFineSimu(:, idDirectObs) ycom];
else
    newSimu = xFineSimu(:, idDirectObs);
end

% Write obs in RealisticData.def
if ~exist(['.' filesep 'Data'],'dir')
    mkdir('Data')
end
fileID = fopen(['Data' filesep 'RealisticData.def'],'w');
fprintf(fileID,'%s\n','DESCRIPTION') ;
fprintf(fileID,'\n%s\n','PREDICTOR') ;
fprintf(fileID,'\n%s\t%s\t%s\t%s\t%i\t%i\n','time','T','n/a','time',0,ar.model.tLim(2)) ;
fprintf(fileID,'\n%s\n','INPUTS') ;
fprintf(fileID,'\n%s\n','OBSERVABLES') ;
% compounds
ystates = directObs;
for i=1:nComp
    statescom = statescomind{i,1};
    comform = statescomind{i,1};
    for ii=2:size(statescomind,2)
        if ~isempty(statescomind{i,ii})
            statescom = [statescom '_add_' statescomind{i,ii}];
            comform = [comform '+' statescomind{i,ii}];
        end
    end
    if length(statescom)>63
        statescom = statescom(1:63);
    end
    ystates = [ystates statescom];
    if idLog(i)
        logflag=1;
    else
        logflag=0;
    end
    if any(idScale==i)
        if any(idOffset==i)
            fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [statescom '_obs'],'C','n/a','conc.',0,logflag,['"offset_'  statescom '+ scale_' statescom '*( ' comform ')"']) ;
        else
            fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [statescom '_obs'],'C','n/a','conc.',0,logflag,['"scale_' statescom '*(' comform ')"']) ;
        end
    else
        fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [statescom '_obs'],'C','n/a','conc.',0,logflag,['"' comform '"']) ;
    end
end
for i=1:nObs-nComp
    if idLog(i+nComp)
        logflag=1;
    else
        logflag=0;
    end
    if any(idScale==i+nComp)
        if any(idOffset==i+nComp)
            fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [directObs{i} '_obs'],'C','n/a','conc.',0,logflag,['"offset_' directObs{i} '+ scale_' directObs{i} '* ' directObs{i} '"']) ;
        else
            fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [directObs{i} '_obs'],'C','n/a','conc.',0,logflag,['"scale_' directObs{i} '*' directObs{i} '"']) ;
        end
    else
        fprintf(fileID,'%s\t%s\t%s\t%s\t%i\t%i\t%s\n', [directObs{i} '_obs'],'C','n/a','conc.',0,logflag,['"' directObs{i} '"']) ;
    end
end

fprintf(fileID,'\n%s\n','ERRORS') ;
for i = 1:length(ystates)
    fprintf(fileID,'%s\t%s\n',[ystates{i} '_obs'],[ '"sd_' ystates{i} '"']) ;
end
% Rel + abs
% for i = 1:length(yNames)
%     fprintf(fileID,'%s\t%s\n',yNames{i},[ '"sd_abs_' yNames{i} ' + sd_rel_' yNames{i} ' * ' yNames{i} '"']) ;
% end

fprintf(fileID,'\n%s\n','CONDITIONS') ;
fprintf(fileID,'\n%s\n','RANDOM') ;
fprintf(fileID,'\n%s\n','PARAMETERS') ;

for i = 1:length(idInit)
    value = log10(nanmin(newSimu(newSimu(:,idInit(i))>0, idInit(i)))/2);
    fprintf(fileID,'%s\t%f\t%i\t%i\t%f\t%f\n',['init_' ystates{idInit(i)}],value,1,1,floor(value-2),ceil(value+2));
end

% Error parameters
sdmodel = -0.96 + randn(1)*0.3;
sd = nan(nObs,1);
for i = 1:nObs
    sd(i) = sdmodel + randn(1)*0.014;
    if ~idLog(i)
        sd(i) = sd(i) + log10(nanmean(newSimu(:,i)));
    end
    fprintf(fileID,'%s\t%f\t%i\t%i\t%f\t%f\n',['sd_' ystates{i}],sd(i),1,1,floor(sd(i)-2),ceil(sd(i)+2));
    %fprintf(fileID,'%s\t%f\t%i\t%i\t%f\t%f\n',['sd_' ystates{i}],sdmean+randn(1)*0.4,1,1,-5,3);
end
fclose(fileID);

% Write in ar
ar.model.data.yFineSimu = newSimu;
ar.model.data.y = ystates;
ar.model.data.tFine = ar.model.condition.tFine;

fprintf('Observables assigned. \n');