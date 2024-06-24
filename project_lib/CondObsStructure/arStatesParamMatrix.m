function [qInSettingMat, paramsMat, uniqIndicesMat, heatMapData] = arStatesParamMatrix(m, setting, qPlot)

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

    case {'data', 'd'}
        setting = 'data';
        nRows = length(ar.model(m).data);

    otherwise
        error('Unknown setting')
end

m = 1;
[allStateSets, ~] = arObsStringRepresent(m, 'all');
uniqStateSets = unique(allStateSets);
nCols = length(uniqStateSets);

qInSettingMat = zeros(nRows, nCols);
paramsMat = cell(nRows, nCols);
uniqIndicesMat = cell(nRows, nCols);

for iRow = 1:nRows
    [rowStateSets, rowParamSets] = arObsStringRepresent(m, setting, iRow);
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            qInSettingMat(iRow, iCol) = 1;
            paramsMat{iRow, iCol} = rowParamSets(rowStateSets == uniqStateSets(iCol));
        end
    end
end

paramSets = {};
for iCol = 1:nCols
    paramSets = [paramSets, paramsMat{:, iCol}];
end

% 'global' indices, not just column-wise
uniqParamSets = unique(paramSets, 'stable');

for iCol = 1:nCols
    % colUniqParamSets = unique([paramsMat{:, iCol}], 'stable');
    for iRow=1:nRows
        for iEntry=1:length(paramsMat{iRow, iCol})
            colUniqIndex = find(paramsMat{iRow, iCol}{iEntry} == uniqParamSets);
            uniqIndicesMat{iRow, iCol} = [uniqIndicesMat{iRow, iCol}, colUniqIndex];
        end
    end
end


%% Plots about the condition structure
% How unique are the observables between different data sets?
% reducing observables to sets of states and sets of paramaters

heatMapData = NaN(nRows, nCols);
heatMapLabels = strings(nRows, nCols);

for iRow=1:nRows
    for iCol=1:nCols
        entry = uniqIndicesMat{iRow, iCol};
        heatMapLabels(iRow, iCol) = joinInts2String(entry);
    end
end


% global indices instead of column-wise
for iCol=1:nCols
    nonEmpty = (heatMapLabels(:, iCol)~="");
    [~, ~, uniqLabelIndices] = unique(heatMapLabels(nonEmpty, iCol), 'stable');
    heatMapData(nonEmpty, iCol) = uniqLabelIndices;
end


%% Plot the data
if qPlot

    image = imagesc(heatMapData);

    nColors = max(heatMapData(:));
    colors = parula(nColors);
    % colormap(lines(max(heatMapData(:))))
    % colors = colors(randperm(size(colors, 1)), :);
    % shift every second row by half of the colormap
    shift = mod((2:2:nColors) + ceil(nColors/2), nColors);
    if any(shift == 0)
        shift(shift == 0) = nColors;
    end
    colors(2:2:nColors, :) = colors(shift, :);
    colormap(colors)
    colorbar();
    set(image, 'AlphaData', ~isnan(heatMapData))

    % text labels
    for iRow=1:nRows
        for iCol=1:nCols
            text(iCol, iRow, heatMapLabels(iRow, iCol), ...
                'HorizontalAlignment', 'center')
        end
    end

    % grid lines
    arrayfun(@(x) xline(x), 0.5:(nCols+0.5));
    arrayfun(@(y) yline(y), 0.5:(nRows+0.5));

    % ticks & tick labels
    xticks(1:nCols);
    uniqStateSets = strrep(uniqStateSets, '+', '\newline');
    xticklabels(uniqStateSets)
    xtickangle(0)
    yticks(1:nRows);
    set(gca(), 'TickLength', [0,0]);

    % axis labels & title
    xlabel('index of unique state sets')
    ylabel(setting)
    title(sprintf('Distribution of Observables in %s for Model %i', capitalize(setting), m))

end

end


function jointString = joinInts2String(integerArray)
    stringArray = string(arrayfun(@(x) num2str(x), integerArray, ...
                         'UniformOutput', false));
    jointString = strjoin(stringArray, ', ');
end


function capCharArray = capitalize(charArray)
    if ~isempty(charArray)
        capCharArray = [upper(charArray(1)), lower(charArray(2:end))];
    else
        capCharArray = '';
    end
end