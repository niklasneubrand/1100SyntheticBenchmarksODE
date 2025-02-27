function testIdentifyLocal(outputName, forceAnalysis)
% TESTIDENTIFYLOCAL performs identifiability analysis on the locally fitted model
%
% INPUTS:
%   outputName: (optional) name of the output file to save the results
%               (default: 'resultsIdentifyLocal')
%   forceAnalysis: (optional) flag to force the analysis even if the results are available
%               (default: false)
%
% USAGE: Execute the function in a synthetic benchmark project folder.
%        The function will perform identifiability analysis on the locally fitted model
%        and append the results to a table in the specified .mat file in the folder:
%        'analysisScripts/identifiabilityLocal'.
%

arguments
    outputName (1,:) char = 'resultsIdentifyLocal'
    forceAnalysis (1,1) logical = false
end

global ar
arInit;

%% load previous results if available
% 4: no results loaded, 3: Final, 2: LocallyFitted, 1: ITRP_local
% then, perform the tests in the correct order

loadNames = {'ITRP_local', 'LocallyFitted', 'Final'};
if forceAnalysis
    loadIdx = 4;
else
    loadIdx = tryLoadPreviousResults(loadNames);
end
if loadIdx == 4
    fprintf('Run Setup file.\n')
    Setup;  % we assume that a Setup.m file exists in the project folder
end
if loadIdx >= 3
    fprintf('Run local fit with arFit.\n')
    arFit();
    arSave(loadNames{2})
end
if loadIdx >= 2
    fprintf('Run identifiability test.\n')
    diary(sprintf('%s_testIdentifyLocal.log', ar.info.name))
    arIdentifiablityTest_recursive;
    arSave(loadNames{1})
    diary off
end

%% match identifiable parameters with ar.pLabels
NI_all = cell2mat(ar.NI(1:end-1));
pNonIdent = {NI_all.pLabel};
if isempty(pNonIdent)
    qIdent = ones(size(ar.pLabel), "logical");
elseif length(pNonIdent) == 1
    qIdent = ~strcmp(ar.pLabel, pNonIdent);
else
    qNonIdentCell = cellfun(@(x) strcmp(x, ar.pLabel)', ...
        pNonIdent, 'UniformOutput', false);
    qIdent = ~any(cell2mat(qNonIdentCell)');
end

% create results struct:
results = struct();
results.projectName = string(ar.info.name);
parent = fileparts(ar.info.path);
[~, templateName] = fileparts(parent);
results.templateName = string(templateName);

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
results.ratioIdentAll = sum(qFit&qIdent)/sum(qFit);
results.ratioIdentDyn = sum(qFit&qIdent&qDynamic)/sum(qFit&qDynamic);
results.ratioIdentErr = sum(qFit&qIdent&qError)/sum(qFit&qError);
results.ratioIdentInit = sum(qFit&qIdent&qInitial)/sum(qFit&qInitial);

% embed vectors in cell arrays for table formatting
vectorfields = ["pLabel", "qFit", "qLog10", "qDynamic", "qError", "qInitial", "qIdent"];
for i = 1:length(vectorfields)
    results.(vectorfields{i}) = {results.(vectorfields{i})};
end

%% append the results struct to the results file
% Define the file paths and names for the results file and lock file
currentDir = fileparts(mfilename('fullpath'));
rsDir = fullfile(currentDir, '..', '..');
identifyDir = fullfile(rsDir, 'analysisScripts', 'identifiabilityLocal');
outputFile = fullfile(identifyDir, sprintf('%s.mat', outputName));
lockFile = fullfile(identifyDir, sprintf('%s.lock', outputName));

% Acquire lock before accessing the result file
acquireLock(lockFile);

% Load the existing results table from the file
if exist(outputFile, 'file') == 2
    load(outputFile, 'resultsTable');
end

% create or update the results table
resultsTable(results.projectName, :) = struct2table(results);

% Save the updated table back to the file and release the lock
save(outputFile, 'resultsTable');
releaseLock(lockFile);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Auxillary functions for loading results

function idx = tryLoadPreviousResults(loadNames)
% TRYLOADPREVIOUSRESULTS Load the previous results from the Results folder

for idx = 1:length(loadNames)
    attempt = loadNames{idx};
    loaded = arLoadLatest(attempt);
    if loaded
        fprintf('Previous results "%s" loaded successfully.\n', attempt)
        return
    else 
        fprintf('No results "%s" found.\n', attempt)
    end
end

% no results loaded
idx = 4;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Auxillary functions for robust file access

% Function to acquire lock
function acquireLock(lockFile)
while exist(lockFile, 'file') == 2
    % If lock file exists, wait for a short period before retrying
    pause(0.1);  % Adjust the sleep time as needed
end
% Create the lock file to indicate this worker has the lock
fid = fopen(lockFile, 'w');
if fid == -1
    warning('Creating .lock file failed.')
end
fclose(fid);
end

% Function to release lock
function releaseLock(lockFile)
delete(lockFile);  % Remove the lock file to release the lock
end
