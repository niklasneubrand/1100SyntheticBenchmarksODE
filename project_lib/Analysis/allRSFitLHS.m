function allRSFitLHS(resultsSet, nLHS)

global ar

realDir = fileparts(which('initRealisticBenchmarks'));
resultsDir = fullfile(realDir, 'RS_IMBI', resultsSet);


d2dProjectFolders = arListProjectsRecursive(resultsDir, true);
prevDir = cd(resultsDir);

% perform LHS fits for all realistic simulations
for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    prevDir = cd(subDir);
    arLoadLatest('final');
    try
        arFitLHS(nLHS);
        arSave(sprintf('%s__LHS__%i', ar.info.name, nLHS));

        % plot the results
        f = arWaterfallPlot;
        figName = sprintf('%s__LHS__%i', ar.info.name, nLHS);
        savefig(f, [figname '.fig']);
        exportgraphics(f, [figName '.pdf'], 'ContentType', 'vector')
        close(f);
    catch ME
        cd(prevDir),
        display(getReport(ME, "extended", "hyperlinks", "on"))
    end
end

cd(prevDir)
