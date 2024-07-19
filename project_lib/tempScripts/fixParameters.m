
global ar

folder = pwd();
d2dProjectFolders = arListProjectsRecursive(folder, true);
startDir = cd(folder);

for id = 1:length(d2dProjectFolders)
    subDir = d2dProjectFolders{id};
    
    if exist(fullfile(subDir, 'RealisticSimulation'), "dir")
        % skip base models
        continue
        
    else
        
        prevDir = cd(subDir);
        loadSuccess = arLoadLatest('Final');
        if ~loadSuccess
            cd(prevDir)
            continue
        end
        
        try
            % load the options struct
            options_file = sprintf('options_%s.mat', ar.info.name);
            options_file = fullfile(pwd(), 'Auxillary', options_file);
            load(options_file)
            
            % recalculate the parameters
            newParams = arRealisticParams(2, 'log-uniform', options.rngSeed);
            ar.p = round(newParams, 3, 'significant');
            arSetParsBounds(3);
            
            % recreate model.def file
            arCreateRealisticModelDef(fullfile(pwd(), 'Models'), options.rngSeed);
                       
            % save the new model
            arSave([ar.info.name '__Final'], false, true);
            rmStatus = rmdir('PEtab', 's');
            arExportPEtab();

            % delete old saves
            oldSave = dir(fullfile('Results', '*__Final'));
            [~, iMin] = min([oldSave.datenum]);
            oldSave = oldSave(iMin).name;
            rmdir(fullfile('Results', oldSave), 's');
            
            % Plot the observables
            arPlotFullPage(); close all;
            
        catch ME
            display(subDir)
            display(getReport(ME, "extended", "hyperlinks", "on"))
        end
    end
end

cd(startDir)



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