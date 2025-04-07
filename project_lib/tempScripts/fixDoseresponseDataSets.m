function fixDoseresponseDataSets()
% FIXDOSERESPONSEDATASETS Fix the dose response datasets in the otherwise completed simulations.
% For this, we load the checkpoint "newTimes" and run the rest of the simualtion pipeline,
% where the bug has been fixed.

% define the project name and path
projectPath = pwd();
[~, projectName] = fileparts(projectPath);
auxFilesDir = fullfile(projectPath, "Auxillary");

% load the simulation options and RSTemplate
load(fullfile(projectPath, 'Auxillary', sprintf('options_%s', projectName)), 'options');
load(fullfile(auxFilesDir, 'RSTemplate_BaseModel'), 'RSTemplate');

% load the checkpoint with the new time points
checkpointName = sprintf('%s__newTimes', projectName);
arLoad(checkpointName);

% update the error models based on new time points
load(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");
obsStruct = arUpdateObsParams(1, obsStruct);
arWriteDataDefFiles(projectName, projectPath, options.rngSeed, ...
                    obsStruct, RSTemplate)
save(fullfile(auxFilesDir, sprintf("obsStruct_%s", projectName)), "obsStruct");

%% Simulate realistic data
arRealisticData(projectName, options.rngSeed);

fprintf('Compiling the final realistically simulated model with data.\n')
Setup;

% Export the model to PEtab
try
    arExportPEtab();
catch ME
    warning('Error while exporting the model to PEtab.')
    display(getReport(ME))
end

% Plot the observables
arPlot();
arPlotFullPage(); close all;

end