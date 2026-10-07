global ar

% initialize the realistic simulations package
realDir = fullfile(pwd(), '..', '..');
startDir = cd(realDir);
initRealisticBenchmarks;
cd(startDir);

% get the folders of all compiled models (templates and synthetic benchmarks)
fast2Folder = fullfile(realDir, 'RS_IMBI', 'fast2_V2');
slow2Folder = fullfile(realDir, 'RS_IMBI', 'slow2_V2');
templateFolders = {fast2Folder, slow2Folder};
templateFolders = arListD2DProjects(templateFolders, "subfolders");
rsFolders = fullfile(realDir, 'SyntheticBenchmarks');
rsFolders = arListD2DProjects(rsFolders, "subsubfolders");
d2dProjectFolders = [templateFolders; rsFolders];
startDir = pwd();

% collect the features of all models
for id = 1:length(d2dProjectFolders)
    % get the project name
    subDir = d2dProjectFolders{id};
    [parentDir, projectName] = fileparts(subDir);
    nameParts = split(projectName, '_', 2);
    templateName = string(nameParts(1));
    qTemplate = ~contains(projectName, '_RS');
    fprintf('processing project %s:\t', projectName)
    
    cd(subDir);
    try
        arLoadLatest('localOptimizationV2_2')
        loadSuccess = 1;
        chi2LocalFit = ar.chi2;
    catch
        loadSuccess = 0;
        chi2LocalFit = NaN;
    end

    if id == 1
        localFitResultsV2_2 = table();
    end
    localFitResultsV2_2 = [localFitResultsV2_2; table(string(projectName), loadSuccess, chi2LocalFit, ...
        'VariableNames', {'projectName', 'loadSuccess', 'chi2LocalFit'})];
end

save(fullfile(startDir,'localFitResultsV2_2.mat'), 'localFitResultsV2_2')

cd(startDir)

% % Initialize realistic simulations package
% startDir = cd('../..');
% initRealisticBenchmarks
% cd(startDir);

% % Define variants
% variant = '2';

% % Generate patterns & output filenames
% patterns = cellfun(@(v) sprintf('report__localOptimizationV2_%s__*.mat', v), variants, 'UniformOutput', false);
% outFiles = cellfun(@(v) sprintf('mergedReport_localOptimization_%s.mat', v), variants, 'UniformOutput', false);

% % Load reports
% reports = cell(size(variants));
% for i = 1:numel(variants)
%     reports{i} = arMergeTableFiles(pwd(), patterns{i}, outFiles{i});
% end

% %% Merge all reports
% mergedTab = reports{1}(~reports{1}.isTemplate, {'projectName', 'success', 'errorReport'});
% mergedTab.Properties.VariableNames{'success'} = ['success_V' variants{1}];
% mergedTab.Properties.VariableNames{'errorReport'} = ['error_V' variants{1}];

% for i = 2:numel(reports)
%     tmp = reports{i}(~reports{i}.isTemplate, {'projectName', 'success', 'errorReport'});
%     tmp.Properties.VariableNames{'success'} = ['success_V' variants{i}];
%     tmp.Properties.VariableNames{'errorReport'} = ['error_V' variants{i}];
%     mergedTab = outerjoin(mergedTab, tmp, 'Keys', 'projectName', 'MergeKeys', true);
% end
% % define templateName
% projectNameParts = split(mergedTab.projectName, '_', 2);
% mergedTab.templateName = projectNameParts(:, 1);

% % move the templateName to the first column
% mergedTab = movevars(mergedTab, 'templateName', 'Before', 'projectName');
% % move the error columns to the end
% varNames = mergedTab.Properties.VariableNames;
% errorVars = varNames(contains(varNames, 'error'));
% successVars = varNames(contains(varNames, 'success'));
% mergedTab = movevars(mergedTab, successVars, 'After', 'projectName'); 
% mergedTab = movevars(mergedTab, errorVars, 'After', successVars(end));


% %% Add combined success columns
% successVars = mergedTab.Properties.VariableNames(3:6); % all success_* columns
% mergedTab.success_any = any(table2array(mergedTab(:, successVars)), 2);
% mergedTab.successTillConv = mergedTab.success_V1 | mergedTab.success_V2;
% mergedTab.successTolFun = mergedTab.success_V3 | mergedTab.success_V4;
% % mergedTab.success_V2orV3 = mergedTab.success_V2 | mergedTab.success_V3;
% % mergedTab.success_V1orV2orV3 = mergedTab.success_V1 | mergedTab.success_V2 | mergedTab.success_V3;
% % combinedVars = {'success_any', 'success_V2orV3', 'success_V1orV2orV3', ...
% %    'success_V2orRestricted', 'success_V2orRestrictedorV3'};
% combinedVars = {'success_any', 'successTillConv', 'successTolFun'};

% %% Create summaryTab (mean success per template)
% summaryTab = groupsummary(mergedTab, 'templateName', 'mean', [successVars, combinedVars]);

% %% Add min / max rows
% minRow  = varfun(@(x) min(x, [], 'omitnan'), summaryTab(:, 2:end));
% meanRow = varfun(@(x) mean(x, 'omitnan'), summaryTab(:, 2:end));
% maxRow  = varfun(@(x) max(x, [], 'omitnan'), summaryTab(:, 2:end));

% minRow.Properties.VariableNames  = summaryTab.Properties.VariableNames(2:end);
% meanRow.Properties.VariableNames = summaryTab.Properties.VariableNames(2:end);
% maxRow.Properties.VariableNames  = summaryTab.Properties.VariableNames(2:end);

% minRow.templateName  = "MIN";
% meanRow.templateName = "MEAN";
% maxRow.templateName  = "MAX";

% summaryTab = [summaryTab; maxRow; meanRow; minRow];

% %% Save outputs
% % writetable(mergedTab, 'successRateCombinedTable.csv', 'Delimiter', ';', 'QuoteStrings', true);
% % writetable(summaryTab, 'successRateSummaryTable.csv',  'Delimiter', ';', 'QuoteStrings', true);
% save('localOptimizationAnalyseResults.mat', 'mergedTab', 'summaryTab');
% fprintf('Saved mergedTab and summaryTab.\n');
