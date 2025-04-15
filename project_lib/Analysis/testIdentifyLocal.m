function testIdentifyLocal(loadNames, saveName, resultsName)
% TESTIDENTIFYLOCAL performs identifiability analysis on the locally fitted model
%
% INPUTS:
%   loadName: (optional) names of the ar struct to load. Multiple names can be provided as
%       fallbacks in case the first one is not found. (default: 'localOptimization')
%   saveName: (optional) name of the ar struct to save results (default: 'localIdentifyTest')
%   outputName: (optional) name of the output file to save the results table
%               (default: 'resultsIdentifyLocal')
%
% USAGE: Execute the function in a synthetic benchmark project folder.
%        The function will perform identifiability analysis on the locally fitted model
%        and append the results to a table in the specified .mat file in the folder:
%        'analysisScripts/identifiabilityLocal'.
%

arguments
    loadNames (:,:) char = 'localOptimization'
    saveName (1,:) char = 'localIdentifyTest'
    resultsName (1,:) char = 'resultsIdentifyLocal'
end

diary('testIdentifyLocal.log')

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

%% perform identifiability analysis
fprintf('Run identifiability test.\n')
arIdentifiablityTest_recursive;
arSave(saveName)

%% analyze the results
% match identifiable parameters with ar.pLabels
NI_all = cell2mat(ar.NI(1:end-1));
if isempty(NI_all)
    % no non-identifiable parameters
    qIdent = ones(size(ar.pLabel), "logical");
else
    % list of non-identifiable parameters
    pNonIdent = {NI_all.pLabel};
    if length(pNonIdent) == 1
        qIdent = ~strcmp(ar.pLabel, pNonIdent);
    else
        qNonIdentCell = cellfun(@(x) strcmp(x, ar.pLabel)', ...
            pNonIdent, 'UniformOutput', false);
        qIdent = ~any(cell2mat(qNonIdentCell)');
    end    
end

% create results struct
results = struct();
results.projectName = string(ar.info.name);
parent = fileparts(ar.info.path);
[~, templateName] = fileparts(parent);
results.templateName = string(templateName);
results.localOptimVariant = string(loadName);

% collect all subsets that could be interesting to analyze
qFit = logical(ar.qFit);
qLog10 = logical(ar.qLog10);
qDynamic = logical(ar.qDynamic);
qError = logical(ar.qError);
qInitial = logical(ar.qInitial);

% store the results in the struct
results.pLabel = ar.pLabel;
results.qFit = qFit;
results.qLog10 = qLog10;
results.qDynamic = qDynamic;
results.qError = qError;
results.qInitial = qInitial;
results.qIdent = qIdent;

% calculate ratios of identifiable parameters
results.nNonIdent = sum(qFit&~qIdent);
results.ratioIdentAll = sum(qFit&qIdent)/sum(qFit);
results.ratioIdentDyn = sum(qFit&qIdent&qDynamic)/sum(qFit&qDynamic);
results.ratioIdentErr = sum(qFit&qIdent&qError)/sum(qFit&qError);
results.ratioIdentInit = sum(qFit&qIdent&qInitial)/sum(qFit&qInitial);

% embed vectors in cell arrays for table formatting
vectorfields = ["pLabel", "qFit", "qLog10", "qDynamic", "qError", "qInitial", "qIdent"];
for i = 1:length(vectorfields)
    results.(vectorfields{i}) = {results.(vectorfields{i})};
end

%% save results as table
resultsTable(results.projectName, :) = struct2table(results);
localSavefile = fullfile(ar.info.path, sprintf('%s__%s.mat', resultsName, ar.info.name));
save(localSavefile, 'resultsTable');

end