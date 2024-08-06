function arPlotXTrajectoriesDR(cDR)

global ar

% Plot the trajectories of the DRs

if nargin == 0
    cDR = unique([ar.model.data([ar.model.data(:).doseresponse]).cLink]);
end

xNames = ar.model.xNames;
nStates = length(xNames);
nD2DPlots = length(ar.model.plot);

for i = 1:length(cDR)

    c = cDR(i);

    f = figure(nD2DPlots+i);
    f.Name = ['X: DR Condition ' num2str(c)];
    f.NumberTitle = 'off';

    tiles = tiledlayout("flow");
    tiles.TileSpacing = 'compact';

    for j = 1:nStates
        nexttile
        
        x = ar.model.condition(c).xFineSimu(:, j);
        t = ar.model.condition(c).tFine;

        plot(t, x)
        title(xNames(j))

    end

    title(tiles, ['X Trajectories of the DRs for condition = ' num2str(c)])
end