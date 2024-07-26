function arRealisticTimesRTF(rngSeed)

arguments
    rngSeed (1,:) = 'shuffle'
end

global ar  %#ok<*GVMIS>

% load RTF package
rtfPath = fullfile(ar.info.ar_path, 'Examples', 'ToyModels', ...
                   'TransientFunction', 'TransientFunction_library');
checkRTF = which('arFitTransientFunction2');
if isempty(checkRTF)
    addpath(rtfPath);
end

for m = 1:length(ar.model)
    
    arBackup = arDeepCopy(ar); % arTransientFit overwrites ar -> save a copy of ar

    % we do not know the time-scales exactly because of randomized parameters
    % -> extend the time range for RTF fitting
    % if I increased the time range more, I had the impression that fitting performance degraded
    % for similar reasons, i did not increase the number of time points
    for d = 1:length(ar.model(m).data)
        ar.model(m).data(d).tLim(2) = 2*ar.model(m).data(d).tLim(2);
    end

    % transform all observables to lin scale for RTF fitting
    for d = 1:length(ar.model(m).data)
        ar.model(m).data(d).logplotting(:) = 0;
        ar.model(m).data(d).logfitting(:) = 0;
    end

    arLink();

    % Siumlate model dynamics for RTF fits
    arSimu(false, true, true);
       
    % Convert orders of magnitude (be compatible with RTF param bounds)
    timeRescaleFactorsAll = cell(1, length(ar.model(m).data));
    for d = 1:length(ar.model(m).data)
        timeRescaleFactorsAll{d} = arMagnitudeConversion(m, d);
    end

    % Fit Transient Function
    [rtfParamsAll, qFitSuccessAll] = arTransientPars(m);
    ar = arDeepCopy(arBackup); % restore ar from backup
    
    % Handle failed fits -> interpolated RTF parameters from successful fits
    if all(~[qFitSuccessAll{:}])
        error('All RTF fits failed in all conditions. No realistic time points can be assigned.');
    end
    
    for d = 1:length(ar.model(m).data)
        if all(~qFitSuccessAll{d})
            warning('All RTF fits failed in condition %i. Interpolate RTF parameters from successful fits in all other conditions.', d);
            rtfParamsJoined = vertcat(rtfParamsAll{:});
            qFitSuccessJoined = horzcat(qFitSuccessAll{:});
            replaceParams = median(rtfParamsJoined{qFitSuccessJoined, :}, 1);
            rtfParamsAll{d}{~qFitSuccessAll{d}, :} = repmat(replaceParams, sum(~qFitSuccessAll{d}), 1);

        elseif any(~qFitSuccessAll{d})
            warning('Some RTF fits failed in condition %i. Interpolate RTF parameters from sucessful fits in this condition.', d);
            replaceParams = median(rtfParamsAll{d}{qFitSuccessAll{d}, :}, 1);
            rtfParamsAll{d}{~qFitSuccessAll{d}, :} = repmat(replaceParams, sum(~qFitSuccessAll{d}), 1);
        end
    end
    
    % Determine the time points for data generation
    for d = 1:length(ar.model(m).data)
        arSetTimePoints(rtfParamsAll{d}, m, d, timeRescaleFactorsAll{d}, rngSeed);
        if isnumeric(rngSeed)
            % change seed for next data set
            % -> time-points drawn independently
            rngSeed = rngSeed + 1;
        end
    end
    
end


% unload RTF package
rmpath(rtfPath);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SUB-FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [rtfParamsAll, qFitSuccessAll] = arTransientPars(m)

arguments
    m (1,1) double {mustBeInteger,mustBePositive} = 1
end

global ar %#ok<*GVMIS>

%% extract trajectories from ar struct
nConds = length(ar.model(m).data);
tAll = {ar.model.data.tFine};
yAll = {ar.model.data.yFineSimu};
yNamesAll = {ar.model.data.y};

% ignore errors of biomodel data file
% is this relevant here? -> arFitTransientFunction2 inits a new ar struct
ar.config.fiterrors = 1;

%% data structure for results
rtfParamsAll = cell(1, nConds);
qFitSuccessAll = cell(1, nConds);
pLabel = {'amp_sust', 'amp_trans', ...
        'offset_TF', 'sd_TF', 'signum_TF', ...
        'timescale_sust', 'timescale_trans', ...
        'toffset_TF'};

%% loop through all trajectories and fit RTF
for c = 1:nConds
    
    % extract data of this condition
    t = tAll{c};
    y = yAll{c};
    yname = yNamesAll{c};
    nObs = size(y, 2);

    % create data structure for results of this condition
    
    rtfParams = table('Size', [nObs, 8], ...
        'VariableTypes', repmat("double", 1, 8), ...
        'VariableNames', pLabel);
    qFitSuccess = false(1, nObs);


    for iObs = 1:nObs
    
        dat.tExp = t(:,1);
        if iObs>1 && size(t,2)>1
            dat.tExp = t(:,iObs);
        end
        dat.yExp = y(:,iObs);
        dat.ystd = nan(size(dat.yExp));
        
        figuresPath = fullfile(pwd(), 'Auxillary');
        mkdir(figuresPath);
        
        try
            figFile = fullfile(figuresPath, sprintf('rtfFit_C%d_%s', c, yname{iObs}));
            res = arFitTransientFunction2(dat, figFile);
            rtfParams{iObs,:} = res.pRescaled;
            qFitSuccess(iObs) = true;
        catch ME
            qFitSuccess(iObs) = false;
            disp(getReport(ME, 'extended', 'hyperlinks', 'on'));
        end
        
    end

    rtfParamsAll{c} = rtfParams;
    qFitSuccessAll{c} = qFitSuccess;
    
    writetable([array2table(yname'), rtfParams], ...
               sprintf('Auxillary/rtfParams_M%d_C%d.csv', m, c));    
    
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function tT = arSetTimePoints(transPars, m, d, convertt, rngSeed)

arguments
    transPars (:,:) table
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    d (1,1) double {mustBeInteger, mustBePositive} = 1
    convertt (1,:) double {mustBeNumeric, mustBePositive} = 1
    rngSeed (1,:) = 'shuffle'
end

global ar

nx = length(ar.model(m).x);
ny = length(ar.model(m).data(d).y);

rng(rngSeed);

sust_times_trans = transPars.timescale_sust.*transPars.timescale_trans;
% max_sus_model = max(transPars.timescale_sust, [], "omitnan");
% max_tr_model = max(transPars.timescale_trans, [], "omitnan");
% min_sus_model = min(transPars.timescale_sust, [], "omitnan");
% min_tr_model = min(transPars.timescale_trans, [], "omitnan");

% aus 2017
% T = 1.76 + 0.15*tsus + 0.24*ttrans -0.03*tsus.*ttrans+0.01*toff;
%n = ceil(10.^(1.04 -0.07*tsus + 0.06*ttrans -0.01*tsus.*ttrans));
% 2022:
% T =      10.^(2.17 +0.00034*transPars.toffset_TF +0.0035/nx +0.014/ny +0.011*transPars.amp_sust -0.022*transPars.amp_trans +0.67*min_sus_model +0.08*min_tr_model +0.03*transPars.timescale_sust +0.143*transPars.timescale_trans +0.03*sust_times_trans +randn(size(transPars,1),1)*0.03); % 0.3
% n = round(10.^(1.04 -0.00032*transPars.toffset_TF +0.0015/nx -0.016/ny +0.013*transPars.amp_trans -0.07*max_sus_model +0.07*max_tr_model +0.049*transPars.timescale_sust +0.05*transPars.timescale_trans -0.033*sust_times_trans +randn(size(transPars,1),1)*0.02)); % 0.2
% lambda =  0.667 -0.00017*transPars.toffset_TF -0.0038/nx +0.0039/ny -0.013*transPars.amp_trans -0.121*max_sus_model +0.086*max_tr_model -0.04*transPars.timescale_trans      +randn(size(transPars,1),1)*0.01;
% potenz =  1.75 +0.00022*transPars.toffset_TF +0.0086/nx -0.009/ny +0.036*transPars.amp_trans +0.14*max_sus_model -0.18*max_tr_model +0.08*transPars.timescale_sust +0.14*transPars.timescale_trans -0.032*sust_times_trans +randn(size(transPars,1),1)*0.03;
% nur observable variable, not model parameter
T =      10.^(1.58 +0.00151*transPars.toffset_TF -0.0046/nx +0.016/ny -0.019*transPars.amp_trans +0.13*transPars.timescale_sust +0.28*transPars.timescale_trans +0.042*sust_times_trans +randn(size(transPars,1),1)*0.04); % 0.3
n = round(10.^(1.02 -0.00029*transPars.toffset_TF +0.0016/nx -0.014/ny +0.015*transPars.amp_trans +0.037*transPars.timescale_sust +0.059*transPars.timescale_trans -0.03*sust_times_trans +randn(size(transPars,1),1)*0.02)); % 0.2
lambda =  0.616 -0.00015*transPars.toffset_TF -0.0039/nx +0.0063/ny -0.006*transPars.amp_sust -0.006*transPars.amp_trans -0.014*transPars.timescale_sust -0.044*transPars.timescale_trans     +randn(size(transPars,1),1)*0.01;
potenz =  1.73 +0.0073/nx -0.013/ny +0.031*transPars.amp_trans +0.08*transPars.timescale_sust +0.098*transPars.timescale_trans -0.035*sust_times_trans +randn(size(transPars,1),1)*0.04;

% limit T based on the time range of the original model
% tMax = max([ar.model(m).data(:).tLim]);
% tMax = max(tMax, ar.model.tLim(2));
tMax = ar.model.data(d).tLim(2);
tMax = 2 * tMax;  % extend possible time-range due to randomized parameters
tMax = convertt * tMax;
T = min(T, tMax);

tT = nan(max(n),length(T));
for k = 1:length(T)
    x = linspace(0,1,n(k));
    tT(1:n(k),k) = (lambda(k).*x+(1-lambda(k)).*x.*((exp(log(2)*x)-1).^potenz(k))).*T(k);
end

tT = tT./convertt; % biomodel was scaled to range(t)>10 || <100

%tT = round(tT,2,'significant');
mag = 10.^(8:-1:-8);
for i=1:length(mag)
    tT(tT>mag(i)) = round(tT(tT>mag(i))*2,-log10(mag(i)))/2;
end


% dummy values for data
y = nan(size(tT));
y(~isnan(tT)) = 1;

% convert time data format
[tExp, yExp] = artExpToVector(tT, y);

% save data to ar structure
ar.model(m).data(d).tT = tT;                   % time points for each observable
ar.model(m).data(d).tExp = tExp;               % time points combined
ar.model(m).data(d).yExp = yExp;               % dummy values
ar.model(m).data(d).yExpStd = nan(size(yExp)); % errors have to be fitted

arLink();

writematrix(tT, sprintf('Auxillary/TimePoints_C%d.csv', d));
fprintf('Realistic time Points are assigned.\n');

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [T,yExp] = artExpToVector(tT,y)

global ar

% Replace small and negative values
y(-1e-6<y & y<1e-8 & y~=0) = 1e-8;

% heuristic to further replace small values:
% If more data points below a threshold than the number of observables
% replace the data points below the threshold with the threshold

for exponent = -8:-3
    threshold = 10^(exponent);
    if length(y(y<threshold))<size(y,2)
        y(y<threshold)=threshold;
    end
end


% Order data all in one matrix
T = unique(sort(tT(~isnan(tT(:)))));
yExp = nan(size(T,1),size(tT,2));
for it=1:size(y,1)
    for iObs=1:size(y,2)
        for jt=1:size(T,1)
            if tT(it,iObs)==T(jt)
                yExp(jt,iObs) = y(it,iObs);
            end
        end
    end
end
while all(isnan(yExp(end,:)))
    yExp(end,:) = [];
    T(end) = [];
end

end