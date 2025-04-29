function fixAllParamBounds()
% This function fixes the parameter bounds in the .def file and in the ar struct.
% it assumes that we start the function in the folder of the template project.

global ar
arLoadLatest('normal')
lb = ar.lb;
ub = ar.ub;

templateName = ar.info.name;
startDir = pwd();
parentDir = fullfile('../../../SyntheticBenchmarks', templateName);
projectDirs = arListD2DProjects(parentDir);

for i = 1:length(projectDirs)
    cd(projectDirs(i))
    fprintf('Fixing parameter bounds in %s\n', projectDirs(i))

    % load the project
    updateParamsInArStruct(lb, ub)
    updateParamsInModelDef()
end

cd(startDir)
fprintf('Finished fixing parameter bounds for template %s\n', templateName)

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

% Define the heading for the PARAMETERS section
paramHeading = "PARAMETERS";

% Split the file content into sections
sections = splitlines(file_content);
paramStartIdx = find(contains(sections, paramHeading), 1);

% Create new parameter section (only include dynamic parameters)
newParamSection = {paramHeading};
for ip = 1:length(ar.p)
    if ar.qDynamic(ip)
        newParam = sprintf('%s\t%.5g\t%i\t%i\t%i\t%i', ...
            ar.pLabel{ip}, ar.p(ip), ar.qFit(ip), ar.qLog10(ip), ar.lb(ip), ar.ub(ip));
        newParamSection{end+1} = newParam; %#ok<AGROW>
    end
end

% Replace the old PARAMETERS section
sections(paramStartIdx:end) = [newParamSection, {''}];

% Write the modified content back to the file
fid = fopen(defFile, 'w');
fprintf(fid, '%s\n', sections{:});
fclose(fid);

end


function updateParamsInArStruct(lb, ub)

global ar

% load compiled model
arLoadLatest('Final')

% round the bounds to have a nice number
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% increase the bounds if violated
boundRanges = range([lb; ub]);
boundIncreaseFactor = 0.1;
lbViolated = ar.p<lb & logical(ar.qDynamic);
ubViolated = ar.p>ub & logical(ar.qDynamic);
lb(lbViolated) = lb(lbViolated) - boundIncreaseFactor*boundRanges(lbViolated);
ub(ubViolated) = ub(ubViolated) + boundIncreaseFactor*boundRanges(ubViolated);

% round again because of the violation fix
lb = round(lb, 2, 'significant');
ub = round(ub, 2, 'significant');

% set the new bounds
ar.lb = lb;
ar.ub = ub;

% save to results folder
arSave("CompiledProject", true, false);

end
