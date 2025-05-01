%% This script fixes the parameter bounds in the .def file and in the ar struct
% it uses a function that fixes all synthetic benchmarks for a given template
% and loops over all templates

% add the project folders to the path
startDir = cd('../..');
initRealisticBenchmarks;
cd(startDir)

% define the template folders
templateFolders = cellfun(@(x) fullfile('../../RS_IMBI', x), ...
    {'fast2_V2', 'slow2_V2'}, 'UniformOutput', false);
templateFolders = arListD2DProjects(templateFolders, "subsubfolders", false);

% loop over all template folders and fix the bounds
for i=1:length(templateFolders)
    templateFolder = templateFolders{i};
    startDir = cd(templateFolder);

    global ar
    arLoadLatest('normal')
    arTemplate = arDeepCopy(ar);
    cd(startDir)

    templateName = arTemplate.info.name;
    parentDir = fullfile('../../SyntheticBenchmarks', templateName);
    reportName = sprintf('report_fixBounds_%s.mat', templateName); 
    
    arApply2Projects(@fixBounds, parentDir, ... % required arguments
        arTemplate, ... % arguments for fixBounds
        'reportName', reportName); % options for arApply2Projects
end


function fixBounds(arTemplate)

updateParamsInArStruct(arTemplate)
updateParamsInModelDef()
fprintf('done\n')

end


function updateParamsInArStruct(arTemplate)

global ar

% load compiled model
arLoadLatest('Final')

% apply the bounds of the template model
arLoadPars(arTemplate);
lb = ar.lb;
ub = ar.ub;

% reload the compiled model
arLoadLatest('Final')

% round the bounds to have a nice number
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% increase the bounds if violated
boundRanges = range([lb; ub]);
boundIncreaseFactor = 0.1;
lbViolated = ar.p<lb & logical(ar.qDynamic);
ubViolated = ar.p>ub & logical(ar.qDynamic);
lb(lbViolated) = ar.p(lbViolated) - boundIncreaseFactor*boundRanges(lbViolated);
ub(ubViolated) = ar.p(ubViolated) + boundIncreaseFactor*boundRanges(ubViolated);

% round again because of the violation fix
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% set the new bounds
ar.lb = lb;
ar.ub = ub;

% save to results folder
arSave('CompiledProject', true, false);

end


function updateParamsInModelDef()

global ar

% identify def file
modelsDir = fullfile(pwd(), 'Models');
defFiles = dir(fullfile(modelsDir, '*.def'));
defFileName = defFiles.name;
defFile = fullfile(modelsDir, defFileName);

% Read the content of the def file
file_content = fileread(defFile);

% Define the heading for the PARAMETERS section and split content in two parts
paramHeading = 'PARAMETERS';
sections = split(file_content, paramHeading);

% Create new parameter section (only include dynamic parameters)
newParamSection = [paramHeading newline];
for ip = 1:length(ar.p)
    if ar.qDynamic(ip)
        newParam = sprintf('%s\t%.5g\t%i\t%i\t%i\t%i', ...
            ar.pLabel{ip}, ar.p(ip), ar.qFit(ip), ar.qLog10(ip), ar.lb(ip), ar.ub(ip));
        newParamSection = [newParamSection newParam newline];
    end
end

% Replace the old PARAMETERS section
sections{2} = newParamSection;
full_text = join(sections, '');

% Write the modified content back to the file
fid = fopen(defFile, 'w');
fprintf(fid, full_text{:});
fclose(fid);
    
end
    