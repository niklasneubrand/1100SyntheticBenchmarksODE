function sloppyTable = calcSloppiness(loadNames, options)
% sloppynessAnalysis - Calculate the sloppyness of the project
%
% INPUTS:
%   loadNames: (optional) names of the ar struct to load. Multiple names can be provided as
%       fallbacks in case the first one is not found. (default: 'localOptimization')
%

arguments
    loadNames (:,:) char = 'localOptimization'
end

arguments
    options.zeroThreshold (1,1) double = -12
    options.sloppyThreshold (1,1) double = -6
end

diary(sprintf('%s.log', saveName))

%% init d2d and load the locally fitted model
global ar
arInit;
loaded = false;
for i = 1:length(loadNames)
    loadName = loadNames(i);
    fprintf('Loading ar struct from %s\n', loadName)
    loaded = arLoadLatest(loadName);
    if loaded
        break
    end
end
if ~loaded
    error('No Results folder found with loadPattern "%s"', loadName)
end

%% define the project and template name
projectName = string(ar.info.name);
nameParts = split(projectName, '_', 2);
templateName = string(nameParts(1));

%% analyze the sloppyness of the project
fprintf('Run sloppyness analysis.\n')
arCalcMerit;
sloppyStruct = arPlotSloppiness();
close all

fprintf('Create sloppyness table.\n')
log10HessEigen = log10(sloppyStruct.eigen');
log10HessEigen = log10HessEigen - max(log10HessEigen);
log10HessEigen(log10HessEigen < options.zeroThreshold) = -Inf;

minLog10HessEigen = min(log10HessEigen(isfinite(log10HessEigen)));
qSloppy = minLog10HessEigen <= options.sloppyThreshold;

% create reults table
log10HessEigenRaw = {log10(sloppyStruct.eigen')};
log10HessEigen = {log10HessEigen};
sloppyTable = table(projectName, templateName, minLog10HessEigen, qSloppy, log10HessEigen, log10HessEigenRaw);

diary('off')

end