function [qInSettingMat, paramsMat, uniqIndicesMat, h] = arStatesParamMatrix(setting)

arguments
    setting (1,1) string = 'condition'
end

global ar %#ok<GVMIS>

switch setting
    case {'condition', 'cond', 'c'}
        setting = 'condition';
        nRows = length(ar.model.condition);

    case {'data', 'd'}
        setting = 'data';
        nRows = length(ar.model.data);

    otherwise
        error('Unknown setting')
end

iMod = 1;
[allStateSets, ~] = arObsStringRepresent(iMod, 'all');
uniqStateSets = unique(allStateSets);
nCols = length(uniqStateSets);

qInSettingMat = zeros(nRows, nCols);
paramsMat = cell(nRows, nCols);
uniqIndicesMat = cell(nRows, nCols);

for iRow = 1:nRows
    [rowStateSets, rowParamSets] = arObsStringRepresent(iMod, setting, iRow);
    for iCol = 1:nCols
        if ismember(uniqStateSets(iCol), rowStateSets)
            qInSettingMat(iRow, iCol) = 1;
            paramsMat{iRow, iCol} = rowParamSets(rowStateSets == uniqStateSets(iCol));
        end
    end
end

for iCol = 1:nCols
    colUniqParamSets = unique([paramsMat{:, iCol}], 'stable');
    for iRow=1:nRows
        for iEntry=1:length(paramsMat{iRow, iCol})
            colUniqIndex = find(paramsMat{iRow, iCol}{iEntry} == colUniqParamSets);
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

for iCol=1:nCols
    nonEmpty = (heatMapLabels(:, iCol)~="");
    [~, ~, uniqLabelIndices] = unique(heatMapLabels(nonEmpty, iCol), 'stable');
    heatMapData(nonEmpty, iCol) = uniqLabelIndices;
end

%% Plot the data

image = imagesc(heatMapData);
colormap(lines(max(heatMapData(:))))
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
xticklabels(uniqStateSets)
yticks(1:nRows);
set(gca(), 'TickLength', [0,0]);

% axis labels & title
xlabel('index of unique state sets')
ylabel(setting)
title(sprintf('Allocation of Observables in %s', capitalize(setting)))

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


% h = heatmap(uniqStateSets, 1:nRows, heatMatrix, ...
%             'Colormap', lines, ...
%             'MissingDataColor', 'white', ...
%             'FontSize', 12, ...
%             'ColorbarVisible', 'off');
% xlabel('index of unique state sets')
% ylabel(setting)
% title(sprintf('Allocation of Observables in %s', capitalize(setting)))


% heatMatrix = NaN(nRows, nCols);

% for iRow=1:nRows
%     for iCol=1:nCols
%         entry = uniqIndicesMat{iRow, iCol};
%         if ~isempty(entry)
%             heatMatrix(iRow, iCol) = joinDigits(entry);
%         end
%     end
% end


% h = heatmap(uniqStateSets, 1:nRows, heatMatrix, ...
%             'Colormap', lines, ...
%             'MissingDataColor', 'white', ...
%             'FontSize', 12, ...
%             'ColorbarVisible', 'off');
% xlabel('index of unique state sets')
% ylabel(setting)
% title(sprintf('Allocation of Observables in %s', capitalize(setting)))


% function jointNumber = joinDigits(integerArray)
%     
%     soretedArray = sort(integerArray);
%     stringArray = string(arrayfun(@(x) num2str(x), soretedArray, ...
%                          'UniformOutput', false));
%     jointString = strcat(stringArray{:});
%     jointNumber = str2double(jointString);
% end