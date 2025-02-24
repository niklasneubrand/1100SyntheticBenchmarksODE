function testIdentifyLocal(outputName)
% TESTIDENTIFYLOCAL performs identifiability analysis on the locally fitted model
%
% INPUTS:
%   outputName: (optional) name of the output file to save the results
%               (default: 'resultsIdentifyLocal')
%
% USAGE: Execute the function in a synthetic benchmark project folder.
%        The function will perform identifiability analysis on the locally fitted model
%        and append the results to a table in the specified .mat file in the folder:
%        'analysisScripts/identifiabilityLocal'.
%

arguments
    outputName (1,:) char = 'resultsIdentifyLocal'
end

%% load or compile the model
global ar
arInit;
loaded = arLoadLatest('Final');
if ~loaded
    warning('No final results found in Results folder. Run Setup file and restart script.')
    Setup;  % we assume that a Setup.m file exists in the project folder
end


%% local fit around the simulation parameters
fittedName = 'LocallyFitted';
loaded = arLoadLatest(fittedName);
if ~loaded
    try 
        arFit();
        arSave(fittedName)
    catch ME
        warning('Local fit failed. Cannot perform identifiability test.')
        display(getReport(ME, "extended", "hyperlinks", "on"))
        return
    end
end


%% Run identifiability test and collect results
try
    arIdentifiablityTest_recursive;
catch ME
    warning('Identifiability test failed. Cannot collect results.')
    display(getReport(ME, "extended", "hyperlinks", "on"))
    return
end
arSave('ITRP_local')

% match identifiable parameters with ar.pLabels
NI_all = cell2mat(ar.NI(1:end-1));
qNonIdent = any(cell2mat(cellfun(@(x) strcmp(ar.pLabel, x)', {NI_all.pLabel}, 'UniformOutput', false))');
qIdent = ~qNonIdent;

% create results struct:
results = struct();
results.projectName = string(ar.info.name);

% collect all subsets that could be interesting to analyze
results.pLabel = ar.pLabel;
results.qFit = logical(ar.qFit);
results.qLog10 = logical(ar.qLog10);
results.qDynamic = logical(ar.qDynamic);
results.qError = logical(ar.qError);
results.qInitial = logical(ar.qInitial);
results.qIdent = logical(qIdent);

% calculate ratios of identifiable parameters 
results.ratioIdentAll = sum(results.qIdent)/sum(results.qFit);
results.ratioIdentDyn = sum(results.qDynamic&results.qIdent)/sum(results.qDynamic&results.qFit);
results.ratioIdentErr = sum(results.qError&results.qIdent)/sum(results.qError&results.qFit);
results.ratioIdentInit = sum(results.qInitial&results.qIdent)/sum(results.qInitial&results.qFit);

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
