function dataObsMatrix = arObsParamMatrix(m, setting, qPlot)

arguments
    m (1,1) double = 1
    setting (1,1) string = 'condition'
    qPlot (1,1) logical = false
end

global ar %#ok<GVMIS>

switch setting
    case {'condition', 'cond', 'c'}
        setting = 'condition';
        nRows = length(ar.model(m).condition);
        fy = cell(1, nRows);
        for iCond = 1:nRows
            fy{iCond} = vertcat(ar.model(m).data(ar.model(m).condition(iCond).dLink).fy);
        end

    case {'data', 'd'}
        setting = 'data';
        nRows = length(ar.model(m).data);
        fy = {ar.model(m).data(:).fy};

    otherwise
        error('Unknown setting')
end

uniqueObservables = unique(vertcat(ar.model(m).data(:).fy)');
nObs = length(uniqueObservables);
dataObsMatrix = zeros(nRows, nObs);

for iRow = 1:nRows
    for iObs = 1:nObs
        dataObsMatrix(iRow, iObs) = sum(uniqueObservables{iObs} == string(fy{iRow})');
    end
end

%% Plots about the condition structure
% How unique are the observables between different data sets?

if qPlot
    heatmap(dataObsMatrix);
    xlabel('index of unique fy')
    ylabel(setting)
    title(sprintf('Distribution of Observables in %s for Model %i', capitalize(setting), m))
end

end


function capCharArray = capitalize(charArray)
    if ~isempty(charArray)
        capCharArray = [upper(charArray(1)), lower(charArray(2:end))];
    else
        capCharArray = '';
    end
end