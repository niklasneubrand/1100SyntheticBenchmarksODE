function [dataObsMatrix, h] = arObsParamMatrix(setting)

arguments
    setting (1,1) string = 'condition'
end

global ar %#ok<GVMIS>

switch setting
    case {'condition', 'cond', 'c'}
        setting = 'condition';
        nRows = length(ar.model.condition);
        fy = cell(1, nRows);
        for iCond = 1:nRows
            fy{iCond} = vertcat(ar.model.data(ar.model.condition(iCond).dLink).fy);
        end

    case {'data', 'd'}
        setting = 'data';
        nRows = length(ar.model.data);
        fy = {ar.model.data(:).fy};

    otherwise
        error('Unknown setting')
end


uniqueObservables = unique(vertcat(ar.model.data(:).fy)');
nObs = length(uniqueObservables);
dataObsMatrix = zeros(nRows, nObs);

for iRow = 1:nRows
    for iObs = 1:nObs
        % if each variable only occurs once per data set or condition,
        % the following code lines are identical.
        % But the first version also counts for multiple occurances
        dataObsMatrix(iRow, iObs) = sum(uniqueObservables{iObs} == string(fy{iRow})');
        % dataObsMatrix(iRow, iObs) = ismember(uniqueObservables(iObs), fy{iRow});
    end
end


%% Plots about the condition structure
% How unique are the observables between different data sets?

% per data set
h = heatmap(dataObsMatrix);
xlabel('index of unique fy')
ylabel(setting)
title(sprintf('Allocation of Observables in %s', setting))

end