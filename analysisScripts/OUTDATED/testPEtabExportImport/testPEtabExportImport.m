function testPEtabExportImport(folder)

% assume we start in a template folder in RS_IMBI/*/templateName
startDir = cd('../..');
initRealisticBenchmarks;
cd(fullfile(startDir, folder));

% load template
arLoadLatest('normal')

arCalcMerit();
meritOld = arGetMerit();

arExportPEtab();
arPlotFullPage();

arImportPEtab();
arCalcMerit();
meritNew = arGetMerit();

fprintf('Merit before export: %f\n', meritOld);
fprintf('Merit after import: %f\n', meritNew);

end
