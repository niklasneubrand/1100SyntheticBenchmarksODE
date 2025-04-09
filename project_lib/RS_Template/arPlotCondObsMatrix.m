function arPlotCondObsMatrix(RSTemplate, figFile)

arguments
    RSTemplate = arCreateRSTemplate(true, false, false)
    figFile = ""
end


nTC = RSTemplate.nTC; % number of time-courses
nDR = RSTemplate.nDR; % number of dose-responses

condObsMatrix = RSTemplate.condObsMatrix; % condition-observable matrix

nRows = size(condObsMatrix, 1); % number of rows
nCols = size(condObsMatrix, 2); % number of columns


figure;

% Create a tiled layout with specified row ratios
t = tiledlayout(nRows, 1, 'TileSpacing', 'Compact', 'Padding', 'Compact');

% Plot time-course data
if nTC >0
    nexttile([nTC, 1]);
    imagesc(condObsMatrix(1:nTC, :));
    map = [0.8 0.8 0.8      % 0 -> light grey
            0.0 0.5 1.0];    % 1 -> blue
    colormap(map);

    % Ticks & tick labels for the first subplot
    xticks([]);
    yticks(1:nTC);
    set(gca(), 'TickLength', [0,0]);

    % Grid lines for the first subplot
    arrayfun(@(x) xline(x), 0.5:(nCols+0.5));
    arrayfun(@(y) yline(y), 0.5:(nTC+0.5));

    ylabel('time-course');
end

% Plot dose-response data
if nDR > 0
    nexttile([nDR, 1]);
    imagesc(condObsMatrix(nTC+1:end, :));

    % Ticks & tick labels for the second subplot
    xticks(1:nCols);
    yticks(1:(nRows-nTC));
    set(gca(), 'TickLength', [0,0]);

    % Grid lines for the second subplot
    arrayfun(@(x) xline(x), 0.5:(nCols+0.5));
    arrayfun(@(y) yline(y), 0.5:((nRows-nTC)+0.5));

    ylabel('dose-response');
end

% Title and x-label for the whole figure
title(t, 'Condition-Observable Matrix');
xlabel(t, 'observables');

% save the figure
[~] = mkdir('RSTemplate');
savefig(fullfile('RSTemplate', 'condObsMatrix.fig'));

end