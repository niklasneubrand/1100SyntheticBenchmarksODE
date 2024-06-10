function arPlotFullPage(m, layout)

arguments
    m (1,1) double {mustBeInteger, mustBePositive} = 1
    layout (1,:) char = 'custom' 
end

global ar

% Create all the plots
ar.model(m).qPlotYs(:) = 1;
arPlot();

if length(ar.model(m).plot) >= 20 || sum([ar.model(m).plot(:).ny]) >= 100
    layout = 'flow';
end

% setings for the layout:
% Desired width and height (cm) full figure
width_cm = 21; 
height_cm = 29.7;

% Create a new figure
newFig = figure;

% determine the layout
switch layout
    case 'custom'
        % Desired width and hight of the tiles (a.u., only ration relevant)
        tileWidth = 4;
        tileHight = 3;

        % Determine the new layout
        nys = [ar.model(m).plot(:).ny];    % number of observables per condition
        cols = min(nys):max(nys);       % candidates for number of columns
        rows = sum(ceil(repmat(nys', size(cols))./cols));    % corresponding number of rows
        goalRatio = height_cm/width_cm*tileWidth/tileHight;
        [~, iOptimalRatio] = min((goalRatio-rows./cols).^2);
        nRows = rows(iOptimalRatio);
        nCols = cols(iOptimalRatio);

        % Create custom tiled layout
        tiles = tiledlayout(nRows, nCols, "Parent", newFig);

    case 'flow'
        % automatically determine the tiled layout
        tiles = tiledlayout("flow", "Parent", newFig);
end

% Set the properties of the tiled layout (tiles as large as possible)
tiles.Padding = 'tight';
tiles.TileSpacing = 'tight';


% Define colors for each jp (as many as needed)
colors = lines(length(ar.model(m).plot)); % Using MATLAB's lines colormap for distinguishable colors


iTile = 0;  % index for the tiles
for jp = 1:length(ar.model(m).plot)
    % Get the existing figure and its axes handles
    oldFig = ar.model(m).plot(jp).fighandel_y;
    axesHandles = findall(oldFig, 'type', 'axes'); % Find all axes handles in the existing figure

    % Create new subplots layout in the new figure
    for i = 1:length(axesHandles)
        % Create subplot in the new figure
        iTile = iTile + 1;
        ax = nexttile(iTile);
        
        % Copy the original axes' children to the new subplot
        children = copyobj(get(axesHandles(i), 'Children'), ax);
        
        % Change the color of line objects
        for jC = 1:length(children)
            if strcmp(children(jC).Type, 'line') && strcmp(children(jC).LineStyle, 'none')
                set(children(jC), 'Color', colors(jp, :));
                set(children(jC), 'MarkerSize', 10);
            if strcmp(children(jC).Type, 'line') && strcmp(children(jC).LineStyle, '-')
                set(children(jC), 'LineWidth', 0.1);
            end
            elseif strcmp(children(jC).Type, 'text')
                delete(children(jC));
            end
        end

        % Copy titles and add shortcuts for log, scale, and offset
        titleString = get(get(axesHandles(i), 'Title'), 'String');
        addTitle = '';
        if contains(ar.model(m).data(ar.model(m).plot(jp).dLink).fy(i), 'log')
            addTitle = [addTitle 'L'];
        end
        if contains(ar.model(m).data(ar.model(m).plot(jp).dLink).fy(i), 'scale')
            addTitle = [addTitle 'S'];
        end
        if contains(ar.model(m).data(ar.model(m).plot(jp).dLink).fy(i), 'offset')
            addTitle = [addTitle, 'O'];
        end
        if ~isempty(addTitle)
            titleString = [titleString, ' [', addTitle, ']'];
        end
        title(ax, titleString);
    
        % Set axes limits and grid
        xlim(ax, get(axesHandles(i), 'XLim'));
        ylim(ax, get(axesHandles(i), 'YLim'));
        grid(ax, get(axesHandles(i), 'XGrid'));
    end

    if strcmp(layout, 'custom')
        % go to next line
        iTile = nCols*ceil(iTile/nCols);
    end
    
end

% x- and y labels
xlabel(tiles, sprintf('%s [%s]', ar.model(m).tUnits{[3, 2]}))
% ylabel(tiles, 'a.u.')

% figure title
title(tiles, ar.info.name)

% Set the PaperUnits to centimeters and specify the PaperSize and PaperPosition
set(newFig, 'Units', 'centimeters');
set(newFig, 'Position', [0, 0, width_cm, height_cm]);

% Save the figure as a vector graphic PDF using the 'print' function
fileName = sprintf('%s_%s.pdf', ar.info.name, 'arPlotFullPage');
exportgraphics(newFig, fileName,'ContentType','vector');
close all

end