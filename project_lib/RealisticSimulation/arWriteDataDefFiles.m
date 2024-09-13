function arWriteDataDefFiles(projectName, projectPath, rngSeed, obsStruct, RSTemplate, suffix)
% Write obs in RealisticData.def

global ar  %#ok<*GVMIS>

if nargin < 6
    suffix = '';
else
    suffix = strcat('_', suffix);
end

m=1;
nTC = RSTemplate.nTC;
nDR = RSTemplate.nDR;
nExp = nTC + nDR;

% get observables
obsNames = obsStruct.obsNames;
obsExprs = obsStruct.obsExprs;


% create data folder
[~] = mkdir(fullfile(projectPath, 'Data'));


% write def files for all time courses
for idx = 1:nExp   

    %% set values for time course or dose response
    if idx <= nTC
        filename = sprintf('%s_TC%03d%s.def', projectName, idx, suffix);
        cNumber = sprintf('time course, %i', idx);
        predictor_add = '';

        c = RSTemplate.timeCourse(idx).cLink;
        tLim = max([ar.model(m).data(ar.model(m).condition(c).dLink).tLim], [], 'all');
        tLim = max(tLim, ar.model(m).tLim(2));

        replace = RSTemplate.timeCourse(idx).condReplace;
        
    else
        filename = sprintf('%s_DR%03d%s.def', projectName, idx - nTC, suffix);
        cNumber = sprintf('dose response, %i', idx - nTC);
        predictor_add = sprintf('-DOSERESPONSE %s', RSTemplate.doseResponse(idx - nTC).response_parameter);

        tLim = ceil(RSTemplate.doseResponse(idx - nTC).tExp*1.1);

        replace = RSTemplate.doseResponse(idx - nTC).condReplaceRest;
    end

    %% create *.def file
    fileID = fopen(fullfile(projectPath, 'Data', filename), 'w');

    fprintf(fileID, '%s\n', 'DESCRIPTION') ;
    fprintf(fileID, '"Realisticly Set Observables"\n');
    fprintf(fileID, '"Original project:\t%s"\n', RSTemplate.originalName);
    fprintf(fileID, '"RS project name:\t%s"\n', projectName);
    fprintf(fileID, '"Random seed:\t\t%010i"\n', rngSeed);
    fprintf(fileID, '"Data type, index:\t%s"\n', cNumber);

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
            if ismember(iObs, obsStruct.idScale) && ismember(iObs, obsStruct.idOffset)
                expr = sprintf(obsExprs{iObs}, pIdx, pIdx);
            elseif ismember(iObs, obsStruct.idScale) && ~ismember(iObs, obsStruct.idOffset)
                expr = sprintf(obsExprs{iObs}, pIdx);
            else
                expr = obsExprs{iObs};
            end
            fprintf(fileID, '%s\t%s\t%s\t%s\t%i\t%i\t%s\n', ...
                    obsNames{iObs}, 'C', 'n/a', 'conc.', 0, ...
                    obsStruct.qLog(iObs), expr);
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
            lb = floor(sd) - 2;
            ub = ceil(sd) + 2;
            fprintf(fileID, 'sd%i_%s\t%.5g\t%i\t%i\t%i\t%i\n', ...
                    obsStruct.paramIndices(idx, iObs), obsNames{iObs}, sd, 1, 1, lb, ub);
        end
    end
    fprintf(fileID, '\n// Scale and offset parameters\n');
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.paramIndices(idx, iObs))
            if any(obsStruct.idScale==iObs)
                fprintf(fileID, 'scale%i_%s\t%.5g\t%i\t%i\t%i\t%i\n', ...
                        obsStruct.paramIndices(idx, iObs), obsNames{iObs}, 0, 1, 1, -5, 5);
            end
            if any(obsStruct.idOffset==iObs)
                offset = obsStruct.offsetVal(idx, iObs);
                lb = floor(offset) - 2;
                ub = ceil(offset) + 2;
                fprintf(fileID, 'offset%i_%s\t%.5g\t%i\t%i\t%i\t%i\n', ...
                    obsStruct.paramIndices(idx, iObs), obsNames{iObs}, offset, 1, 1, lb, ub);
            end
        end
    end

    fclose(fileID);
end

fprintf('New observables written to data.def files.\n')

end