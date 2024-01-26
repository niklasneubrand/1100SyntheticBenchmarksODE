function arCondObsStructure()

global ar %#ok<*GVMIS>


% Plots that show the condition-observable structure
for m = 1:length(ar.model)

    h(m, 1) = figure;
    arObsParamMatrix(m, 'data', true);

    h(m, 2) = figure;
    arObsParamMatrix(m, 'condition', true);

    h(m, 3) = figure;
    arStatesParamMatrix(m, 'data', true);

    h(m, 4) = figure;
    % Data needed for the realistic simulations
    [~, ~, ~, CondObsMatrix] = arStatesParamMatrix(m, 'condition', true);
    obsDistrDir = fullfile(ar.info.path, 'CondObsStructure');
    obsDistrFile = fullfile(obsDistrDir, sprintf('CondObsMatrix_M%i', m));
    mkdir(obsDistrDir);
    save(obsDistrFile, 'CondObsMatrix')

end

% Save figures to file
fileName = fullfile(ar.info.path, 'CondObsStructure', ...
                    sprintf('ObsModelStructure_%s.fig', ar.info.name));
savefig(h, fileName)
close all

end