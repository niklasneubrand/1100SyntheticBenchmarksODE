load('..\mergeResultsTables\allMergedResults_V2_2')

templateTab = finalMerged(finalMerged.qTemplate==1, :);
% correct mistake in parameter counts
templateTab.nParamsDynFit = cellfun(@(x,y) sum(x & y), templateTab.qFit, templateTab.qDynamic);


vars = {
    'templateName', ...
    'nStates', ...
    'nExp', ...
    'nTC', ...
    'nDR', ...
    'nObsSets', ...
    'nParamsFit', ...
    'nParamsDynFit', ...
    'nDataPoints', ...
    'medErrorExp', ...
    'medTime'};

suppTab = templateTab(:, vars);
suppTabBackup = suppTab;

% reformat table
suppTab.nExp = compose("%d / %d", suppTab.nTC, suppTab.nExp);
suppTab.nTC = [];
suppTab.nDR = [];

suppTab.nParamsFit = compose("%d / %d", suppTab.nParamsDynFit, suppTab.nParamsFit);
suppTab.nParamsDynFit = [];

suppTab.medErrorExp = compose("%.0f", 100*suppTab.medErrorExp);
%  suppTab.medTime = compose("%.0f", suppTab.medTime);

suppTab.medTime = arrayfun(@(t) formatTime(t), suppTab.medTime);


% export to file
writetable(suppTab, 'supplementTable.csv')

% build LaTeX table (self-contained, adds empty Reference column)
colHeaders = {'Template', 'States', 'TC / Exp', 'Observables', 'Dynamic / All Parameters', ...
    'Data Points', 'Median Error (%)', 'Median Time', 'Reference'};

dataRows = strings(height(suppTab), numel(colHeaders));
dataRows(:, 1) = string(suppTab.templateName);
dataRows(:, 2) = string(suppTab.nStates);
dataRows(:, 3) = string(suppTab.nExp);
dataRows(:, 4) = string(suppTab.nObsSets);
dataRows(:, 5) = string(suppTab.nParamsFit);
dataRows(:, 6) = string(suppTab.nDataPoints);
dataRows(:, 7) = string(suppTab.medErrorExp);
dataRows(:, 8) = string(suppTab.medTime);
dataRows(:, 9) = ""; % empty Reference column for later manual fill

rowLines = join(dataRows, " & ", 2) + " \\";
latexLines = [
    "\\begin{tabular}{lrrrrrrrr}"
    "\\hline"
    strjoin(colHeaders, ' & ') + " \\" 
    "\\hline"
    rowLines
    "\\hline"
    "\\end{tabular}"
    ];

% write LaTeX table to disk (compatibly without writelines)
fid = fopen('supplementTable.tex', 'w');
for i = 1:numel(latexLines)
    fprintf(fid, '%s\n', latexLines(i));
end
fclose(fid);


function timeStr = formatTime(seconds)
    if seconds >= 60
        timeStr = compose("%.0f min", seconds / 60);
    elseif seconds >= 1
        timeStr = compose("%.0f s", seconds);
    else
        timeStr = compose("%.0f ms", seconds * 1000);
    end
end