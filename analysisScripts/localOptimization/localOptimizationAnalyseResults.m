% Initialize realistic simulations package
startDir = cd('../..');
initRealisticBenchmarks
cd(startDir);

% Define variants
variants = {'V1', 'V2', 'stepwise_V2', 'restricted_V2', 'V3'};

% Generate patterns & output filenames
patterns = cellfun(@(v) sprintf('apply2ProjectsReport__localOptimization_%s__*.mat', v), variants, 'UniformOutput', false);
outFiles = cellfun(@(v) sprintf('mergedReport_localOptimization_%s.mat', v), variants, 'UniformOutput', false);

% Load reports
reports = cell(size(variants));
for i = 1:numel(variants)
    reports{i} = arMergeTableFiles(pwd(), patterns{i}, outFiles{i});
end

%% Merge all reports
mergedTab = reports{1}(~reports{1}.isTemplate, {'projectName', 'success'});
mergedTab.Properties.VariableNames{'success'} = ['success_' variants{1}];

for i = 2:numel(reports)
    tmp = reports{i}(~reports{i}.isTemplate, {'projectName', 'success'});
    tmp.Properties.VariableNames{'success'} = ['success_' variants{i}];
    mergedTab = outerjoin(mergedTab, tmp, 'Keys', 'projectName', 'MergeKeys', true);
end
% define templateName
projectNameParts = split(mergedTab.projectName, '_', 2);
mergedTab.templateName = projectNameParts(:, 1);
% move the templateName to the first column
mergedTab = movevars(mergedTab, 'templateName', 'Before', 'projectName');

%% Add combined success columns
successVars = mergedTab.Properties.VariableNames(3:end); % all success_* columns
mergedTab.success_any = any(table2array(mergedTab(:, successVars)), 2);
mergedTab.success_V2orV3 = mergedTab.success_V2 | mergedTab.success_V3;
mergedTab.success_V1orV2orV3 = mergedTab.success_V1 | mergedTab.success_V2 | mergedTab.success_V3;
mergedTab.success_V2orRestricted = mergedTab.success_V2 | mergedTab.success_restricted_V2;
mergedTab.success_V2orRestrictedorV3 = mergedTab.success_V2orRestricted | mergedTab.success_V3;
combinedVars = {'success_any', 'success_V2orV3', 'success_V1orV2orV3', ...
    'success_V2orRestricted', 'success_V2orRestrictedorV3'};

%% Create summaryTab (mean success per template)
summaryTab = groupsummary(mergedTab, 'templateName', 'mean', [successVars, combinedVars]);

%% Add min / max rows
minRow  = varfun(@(x) min(x, [], 'omitnan'), summaryTab(:, 2:end));
meanRow = varfun(@(x) mean(x, 'omitnan'), summaryTab(:, 2:end));
maxRow  = varfun(@(x) max(x, [], 'omitnan'), summaryTab(:, 2:end));

minRow.Properties.VariableNames  = summaryTab.Properties.VariableNames(2:end);
meanRow.Properties.VariableNames = summaryTab.Properties.VariableNames(2:end);
maxRow.Properties.VariableNames  = summaryTab.Properties.VariableNames(2:end);

minRow.templateName  = "MIN";
meanRow.templateName = "MEAN";
maxRow.templateName  = "MAX";

summaryTab = [summaryTab; maxRow; meanRow; minRow];

%% Save outputs
% writetable(mergedTab, 'successRateCombinedTable.csv', 'Delimiter', ';', 'QuoteStrings', true);
% writetable(summaryTab, 'successRateSummaryTable.csv',  'Delimiter', ';', 'QuoteStrings', true);
save('localOptimizationAnalyseResults.mat', 'mergedTab', 'summaryTab');
fprintf('Saved mergedTab and summaryTab.\n');
