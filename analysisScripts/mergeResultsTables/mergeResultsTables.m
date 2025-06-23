
%% Read the tables from files

fprintf('importing individual results tables...\t');

% Read file with problem features
feats = open('../getAllRSFeats/allProjectFeats.mat');
problemFeautures = feats.allFeatures;

% Read file with times and errors
timesErrors = open('../getTimesAndErrors/allTimesErrors.mat');
timesErrors = timesErrors.allTimesErrors;
timesErrors.templateName = [];

% Read file with identifyability test
ident = open('../identifiabilityLocal/allIdentifyResults_V2_2.mat');
identifyResults = ident.allIdentifyResults;
qV2_2 = strcmp(identifyResults.localOptimVariant, "localOptimizationV2_2");
identifyResults = identifyResults(qV2_2, :);
identifyResults.localOptimVariant = [];
identifyResults.templateName = [];
identifyResults.Properties.RowNames = {};

% Read file with sloppiness
sloppy = open('../getSloppiness/allSloppinessTab_localOptimizationV2_2.mat');
sloppyResults = sloppy.allSloppinessTab;
sloppyResults.templateName = [];

% Read file with multistart results
multistart = open('../multistartOptimization/allMultistartTab_multistartOptimizationV2_6.mat');
lhsResults = multistart.allMultistartTab;
lhsResults.templateName = [];

fprintf('done.\n');


%% Outer joins step-by-step
fprintf('merging tables...\t');

merged1 = outerjoin(problemFeautures, identifyResults, 'Keys', 'projectName', ...
    'MergeKeys', true, 'Type', 'full');

merged2 = outerjoin(merged1, timesErrors, 'Keys', 'projectName', ...
    'MergeKeys', true, 'Type', 'full');

merged3 = outerjoin(merged2, sloppyResults, 'Keys', 'projectName', ...
    'MergeKeys', true, 'Type', 'full');

merged4 = outerjoin(merged3, lhsResults, 'Keys', 'projectName', ...
    'MergeKeys', true, 'Type', 'full');

finalMerged = merged4;

fprintf('done.\n');


%% post processing
fprintf('post processing and saving...\t');

finalMerged = sortrows(finalMerged, 'projectName');
vars = finalMerged.Properties.VariableNames;
% Find indices
idxProjectName = find(strcmp(vars, 'projectName'));
idxTemplateName = find(strcmp(vars, 'templateName'));
idxQTemplate = find(strcmp(vars, 'qTemplate'));

% Remove these from vars
vars([idxProjectName, idxTemplateName, idxQTemplate]) = [];

% New order: projectName, templateName, qTemplate, rest
finalMerged = finalMerged(:, [{'projectName', 'templateName', 'qTemplate'}, vars]);

% save the final merged table
save('allMergedResults_V2_2.mat', 'finalMerged');

fprintf('done.\n');


%% convert it to a python readable format
fprintf('saving also in a python readable format...\t');

mergedTabPy = finalMerged;
mergedTabPy.projectName = cellstr(mergedTabPy.projectName);
mergedTabPy.templateName = cellstr(mergedTabPy.templateName);
S = table2struct(mergedTabPy);
save('allMergedResults_V2_2_py.mat', 'S', '-v7');

fprintf('done.\n');
fprintf('All done.\n');