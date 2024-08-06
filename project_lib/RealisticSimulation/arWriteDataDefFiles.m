function arWriteDataDefFiles(projectName, projectPath, rngSeed, obsStruct, template, suffix)
% Write obs in RealisticData.def

global ar  %#ok<*GVMIS>

if nargin < 6
    suffix = '';
else
    suffix = strcat('_', suffix);
end

m=1;
nTC = template.nTC;
nDR = template.nDR;
nExp = nTC + nDR;

% get observables
obsNames = obsStruct.obsNames;
obsExprs = obsStruct.obsExprs;


% create data folder
if ~exist(fullfile(projectPath, 'Data'), 'dir')
    mkdir(fullfile(projectPath, 'Data'))
end


% write def files for all time courses
for idx = 1:nExp   

    %% set values for time course or dose response
    if idx <= nTC
        filename = sprintf('%s_TC%i%s.def', projectName, idx, suffix);
        cNumber = sprintf('time course %i', idx);
        predictor_add = '';

        c = template.timeCourse(idx).cLink;
        tLim = max([ar.model(m).data(ar.model(m).condition(c).dLink).tLim], [], 'all');

        replace = template.timeCourse(idx).condReplace;
        
    else
        filename = sprintf('%s_DR%i%s.def', projectName, idx - nTC, suffix);
        cNumber = sprintf('dose response %i', idx - nTC);
        predictor_add = sprintf('-DOSERESPONSE %s', template.doseResponse(idx - nTC).response_parameter);

        tLim = ceil(template.doseResponse(idx - nTC).tExp*1.1);

        replace = template.doseResponse(idx - nTC).condReplaceRest;
    end

    %% create *.def file
    fileID = fopen(fullfile(projectPath, 'Data', filename), 'w');

    fprintf(fileID, '%s\n', 'DESCRIPTION') ;
    fprintf(fileID, '"Realisticly set observables for %s"\n', cNumber);
    fprintf(fileID, '"Identifier: %s"\n', projectName);
    fprintf(fileID, '"Random seed: %i"\n', rngSeed);

    %% Predictor

    fprintf(fileID, '\n\n%s%s\n', 'PREDICTOR', predictor_add);
    fprintf(fileID, '%s\t%s\t%s\t%s\t%i\t%i\n', ...
            'time', ar.model.tUnits{:}, 0, tLim);
    fprintf(fileID, '\n\n%s\n', 'INPUTS') ;

    %% Observables
    fprintf(fileID, '\n\n%s\n', 'OBSERVABLES') ;
    for iObs = 1:obsStruct.nObs
        % check if observable iObs should be created
        if ~isnan(obsStruct.paramIndices(idx, iObs))
            pIdx = obsStruct.paramIndices(idx, iObs);
            if any(obsStruct.idLog==iObs)
                expr = sprintf(obsExprs{iObs}, pIdx, pIdx);
            elseif any(obsStruct.idScale==iObs)
                expr = sprintf(obsExprs{iObs}, pIdx);
            else
                expr = obsExprs{iObs};
            end
            fprintf(fileID, '%s\t%s\t%s\t%s\t%i\t%i\t%s\n', ...
                    obsNames{iObs}, 'C', 'n/a', 'conc.', 0, ...
                    obsStruct.idLog(iObs), expr);
        end
    end

    %% Error models
    fprintf(fileID, '\n\n%s\n', 'ERRORS') ;
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.paramIndices(idx, iObs))
            fprintf(fileID, '%s\tsd%i_%s\n', obsNames{iObs}, obsStruct.paramIndices(idx, iObs), obsNames{iObs});
        end
    end

    %% Conditions
    fprintf(fileID, '\n\n%s\n', 'CONDITIONS') ;
    for iRep = 1:size(replace, 1)
        fprintf(fileID, '%s\t"%s"\n', replace{iRep, :});
    end

    fprintf(fileID, '\n\n%s\n', 'RANDOM') ;

    %% Parameters
    fprintf(fileID, '\n\n%s\n', 'PARAMETERS') ;
    % error parameters
    fprintf(fileID, '// Error parameters\n');
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.paramIndices(idx, iObs))
            sd = obsStruct.stdObs(idx, iObs);
            fprintf(fileID, 'sd%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                    obsStruct.paramIndices(idx, iObs), obsNames{iObs}, sd, 1, 1, floor(sd-2), ceil(sd+2));
        end
    end
    fprintf(fileID, '\n// Scale and offset parameters\n');
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.paramIndices(idx, iObs))
            if any(obsStruct.idScale==iObs)
                fprintf(fileID, 'scale%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                        obsStruct.paramIndices(idx, iObs), obsNames{iObs}, 0, 1, 1, -5, 5);
            end
            if any(obsStruct.idOffset==iObs)
                fprintf(fileID, 'offset%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                    obsStruct.paramIndices(idx, iObs), obsNames{iObs}, 0, 1, 1, -5, 5);
            end
        end
    end

    fclose(fileID);
end

fprintf('New observables written to data.def files.\n')

end