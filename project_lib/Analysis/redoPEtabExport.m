function redoPEtabExport(resultsSet)

global ar

try
    % Export the model to PEtab
    arExportPEtab();
    
    % Plot the observables
    arPlotFullPage();
    
    % clean up the project folder -> remove auxillary files
    movefile("SetupAuxillary.m", fullfile("Auxillary", "SetupAuxillary.m"));
    delete(fullfile("Models", "TransientFunction.def"));
end

end