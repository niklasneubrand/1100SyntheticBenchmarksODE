function arCreateRealisticProject(projectName, projectPath, rngSeed, includeCustomSettings)

global ar  %#ok<*GVMIS>

mkdir(projectPath);
mkdir(fullfile(projectPath, 'Models'));
mkdir(fullfile(projectPath, 'Data'));
mkdir(fullfile(projectPath, 'Auxillary'));

% copy model *.def file
modelfile = fullfile(ar.model.path, ...
    sprintf('%s.def', ar.model.name));
    newName = sprintf('%s.def', projectName);
copyfile(modelfile, fullfile(projectPath, 'Models', newName));

% modify model *.def files -> remove observables, parameter, etc.
arCreateRealisticModelDef(fullfile(projectPath, 'Models'), rngSeed);

% create a setup file for the new model
arCreateRealisticSetup(projectName, projectPath, rngSeed, includeCustomSettings);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AUXILLARY FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function arCreateRealisticModelDef(modelsDir, rngSeed)

global ar

% find all *.def files in the models directory
defFiles = dir(fullfile(modelsDir, '*.def'));
modelsDir = defFiles.folder;
defFileNames = {defFiles.name};

% headings that occur in a def file
defFileHeads = ["DESCRIPTION", "PREDICTOR", "COMPARTMENTS", "STATES", ...
    "INPUTS", "REACTIONS-AMOUNTBASED", "REACTIONS", "ODES", "DERIVED", ...
    "OBSERVABLES", "ERRORS", "SUBSTITUSTIONS", "CONDITIONS", "PARAMETERS"];

% loop over all *.def files
for i = 1:length(defFileNames)
    % read the *.def file
    defFile = fullfile(modelsDir, defFileNames{i});
    file_content = fileread(defFile);
    
    % split file content into sections
    [sections, headings] = split(file_content, defFileHeads);
    
    % modify sections
    description = ['"This is a modified copy of the original model definition file."' newline ...
        '"The original observables and errors have been removed."' newline ...
        '"New, realistically drawn observables are defined in the data definition files."' newline ...
        sprintf('"The random seed is: %i."', rngSeed)];
    if any(headings=="DESCRIPTION")
        originalDescription = [sections{find(headings=="DESCRIPTION")+1}];
        description = [originalDescription description newline newline];
        sections{find(headings=="DESCRIPTION")+1} = description;
    else
        description = [description newline];
        headings = ["DESCRIPTION" headings];
        sections = [description sections];
    end
    % remove observables and errors (will be specified in data *.def files)
    if any(headings=="OBSERVABLES")
        sections{find(headings=="OBSERVABLES")+1} = [newline newline];
    end
    if any(headings=="ERRORS")
        sections{find(headings=="ERRORS")+1} = [newline newline];
    end
    
    % create new parameter section (only include dynamic parameters)
    newParamSection = newline;
    for ip = 1:length(ar.p)
        if ar.qDynamic(ip)
            % ar.pExternLabels   ar.pExtern    ar.qFitExtern    ar.qLog10Extern    ar.lbExtern    ar.ubExtern
            newParam = sprintf('%s\t%.3g\t%i\t%i\t%i\t%i', ...
                ar.pLabel{ip}, ar.p(ip), ar.qFit(ip), ar.qLog10(ip), ar.lb(ip), ar.ub(ip));
            newParamSection = [newParamSection newParam newline];
        end
    end
    
    if any(headings=="PARAMETERS")
        % if there is already a parameters section, replace it
        sections{find(headings=="PARAMETERS")+1} = newParamSection;
    else
        % if there was no parameters section, add it at the end
        headings = [headings; "PARAMETERS"];
        sections = [sections; newParamSection];
    end
    
    % ensure proper linebreak formatting for each section
    sections{1} = '';
    for j = length(sections):-1:2
        sectionText = strtrim(sections{j});
        if isempty(sectionText)
            sections{j} = [newline newline newline];
            % remove empty sections
            % sections(j) = [];
            % headings(j-1) = [];
        else
            sections{j} = [newline sectionText newline newline newline];
        end
    end
    
    % re-join the sections
    file_content = join(sections, headings);
    
    % write the modified content back to the file
    fid = fopen(defFile, 'w');
    fprintf(fid, '%s', file_content{:});
    fclose(fid);
end

end


function arCreateRealisticSetup(projectName, projectPath, rngSeed, includeCustomSettings)

global ar %#ok<*GVMIS>

projectName = string(projectName);
projectPath = string(projectPath);

if includeCustomSettings
    customSettings = arCustomSettings();
else
    customSettings = struct();
end

%% Create the final setup file
fileID = fopen(fullfile(projectPath, "Setup.m"), "w");

fprintf(fileID, "%% Setup file for realistic simulation of benchmark model %s \n", ar.info.name);
fprintf(fileID, "%% Identifier: %s \n", projectName);
fprintf(fileID, "%% Random seed: %i \n\n", rngSeed);
fprintf(fileID, "%% Initialize the d2d toolbox \n");
fprintf(fileID, "arInit();\n\n");

fprintf(fileID, "%% Load the models \n");
for m = 1:length(ar.model)
    fprintf(fileID, "arLoadModel('%s'); \n", projectName);
end
fprintf(fileID, "\n");

fprintf(fileID, "%% Load the data \n");
for m = 1:length(ar.model)
    for c = 1:length(ar.model(m).condition)
        fprintf(fileID, "arLoadData('%s_C%i', 1); \n", projectName, c);
    end
end
fprintf(fileID, "\n");

if ~isempty(fieldnames(customSettings))
    fprintf(fileID, "%% Custom settings \n");
    if isfield(customSettings, 'add_c')
        fprintf(fileID, "ar.config.add_c = %i; \n", customSettings.add_c);
    end
    fprintf(fileID, "\n");
end

fprintf(fileID, "%% Compile the project \n");
fprintf(fileID, "arCompileAll(); \n\n");

% the correct parameters are all in the *.def files
% __newParams on the other hand, contains also old parameters
% fprintf(fileID, "%% Set the parameters \n");
% fprintf(fileID, "arLoadPars('%s__newParams');\n\n", projectName);

fprintf(fileID, "%% Save the project \n");
fprintf(fileID, "arSave('%s__Final', false, true); \n\n", projectName);

fclose(fileID);


%% Create the auxillary setup file
fileID = fopen(fullfile(projectPath, "SetupAuxillary.m"), "w");

fprintf(fileID, "%% Auxillary setup file for realistic simulation of benchmark model %s \n", ar.info.name);
fprintf(fileID, "%% Identifier: %s \n", projectName);
fprintf(fileID, "%% Random Seed: %i \n\n", rngSeed);

fprintf(fileID, "%% Initialize the d2d toolbox \n");
fprintf(fileID, "arInit();\n\n");

fprintf(fileID, "%% Load the models \n");
for m = 1:length(ar.model)
    fprintf(fileID, "arLoadModel('%s'); \n", projectName);
end
fprintf(fileID, "\n");

fprintf(fileID, "%% Load the data \n");
for m = 1:length(ar.model)
    for c = 1:length(ar.model(m).condition)
        fprintf(fileID, "arLoadData('%s_C%i', 1); \n", projectName, c);
    end
end
fprintf(fileID, "\n");

if ~isempty(fieldnames(customSettings))
    fprintf(fileID, "%% Custom settings \n");
    if isfield(customSettings, 'add_c')
        fprintf(fileID, "ar.config.add_c = %i; \n", customSettings.add_c);
    end
    fprintf(fileID, "\n");
end

fprintf(fileID, "%% Compile the project \n");
fprintf(fileID, "arCompileAll(); \n\n");

fprintf(fileID, "%% Set the parameters \n");
fprintf(fileID, "arLoadPars('%s__newParams');\n\n", projectName);

fprintf(fileID, "%% Save the project \n");
fprintf(fileID, "arSave('%s__newObs', false, false); \n\n", projectName);

fclose(fileID);

end