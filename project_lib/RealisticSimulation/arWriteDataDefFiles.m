function arWriteDataDefFiles(projectName, projectPath, rngSeed, obsStruct, condStruct, m)
% Write obs in RealisticData.def

global ar  %#ok<*GVMIS>

% create data folder
if ~exist(fullfile(projectPath, 'Data'), 'dir')
    mkdir(fullfile(projectPath, 'Data'))
end

% write def files for all conditions
for c = 1:length(ar.model(m).condition)

    % create *.def file
    filename = sprintf('%s_M%i_C%i.def', projectName, m, c);
    fileID = fopen(fullfile(projectPath, 'Data', filename), 'w');

    fprintf(fileID, '%s\n', 'DESCRIPTION') ;
    fprintf(fileID, '"Realisticly set observables for model condition %i"\n', c);
    fprintf(fileID, '"Identifier: %s"\n', projectName);
    fprintf(fileID, '"Random seed: %i"\n', rngSeed);

    fprintf(fileID, '\n\n%s\n', 'PREDICTOR') ;
    tLimModel = ar.model(m).tLim(2);
    tLimCond = max([ar.model(m).data(ar.model(m).condition(c).dLink).tLim], [], 'all');
    tLim = max(tLimModel, tLimCond);
    fprintf(fileID, '%s\t%s\t%s\t%s\t%i\t%i\n', ...
            'time', 'T', 'n/a', 'time', 0, tLim) ;
    fprintf(fileID, '\n\n%s\n', 'INPUTS') ;

    %% Observables
    obsNames = cell(1, obsStruct.nObs);
    obsExprs = cell(1, obsStruct.nObs);
    fprintf(fileID, '\n\n%s\n', 'OBSERVABLES') ;
    for iObs = 1:obsStruct.nObs
        % check if observable iObs should be created in condition c
        if ~isnan(obsStruct.CondObsMatrix(c, iObs))
            if iObs <= obsStruct.nDirect
                % directly observed states
                idObs = obsStruct.idDirect(iObs);
                obsNames(iObs) = obsStruct.states(idObs);
                obsExprs(iObs) = obsStruct.states(idObs);
            else
                % compounds
                iComp = iObs - obsStruct.nDirect;
                compName = sprintf('Compound_%i', iComp);
                % compName = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '_add_');
                if length(compName) > 63
                    compName = compName(1:63);
                end
                obsNames{iObs} = compName;
                obsExprs{iObs} = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '+');
            end
            % scale and offset parameters
            if any(obsStruct.idScale==iObs)
                % introduce scaling parameter
                obsExprs{iObs} = sprintf('scale%i_%s*(%s)', ...
                                         obsStruct.CondObsMatrix(c, iObs), ...
                                         obsNames{iObs}, obsExprs{iObs});
                if any(obsStruct.idOffset==iObs)
                    % introduce offset parameter
                    obsExprs{iObs} = sprintf('offset%i_%s+%s', ...
                                             obsStruct.CondObsMatrix(c, iObs), ...
                                             obsNames{iObs}, obsExprs{iObs});
                end
            end
            % write to *.def file
            fprintf(fileID, '%s_obs\t%s\t%s\t%s\t%i\t%i\t%s\n', ...
                    obsNames{iObs}, 'C', 'n/a', 'conc.', 0, ...
                    obsStruct.idLog(iObs), obsExprs{iObs});
        end
    end

    %% Error models
    fprintf(fileID, '\n\n%s\n', 'ERRORS') ;
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.CondObsMatrix(c, iObs))
            fprintf(fileID, '%s_obs\tsd%i_%s\n', obsNames{iObs}, c, obsNames{iObs});
        end
    end

    %% Conditions
    fprintf(fileID, '\n\n%s\n', 'CONDITIONS') ;
    replace = condStruct.condReplace{c};
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
        if ~isnan(obsStruct.CondObsMatrix(c, iObs))
            sd = obsStruct.stdObs(c, iObs);
            fprintf(fileID, 'sd%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                    c, obsNames{iObs}, sd, 1, 1, floor(sd-2), ceil(sd+2));
        end
    end
    fprintf(fileID, '\n// Scale and offset parameters (if not definied in previous data.def file)\n');
    for iObs = 1:obsStruct.nObs
        % check if observable should appear in this condition
        if ~isnan(obsStruct.CondObsMatrix(c, iObs))
            % check if shared parameter is already defined
            if c==1 || (obsStruct.CondObsMatrix(c-1, iObs)~=obsStruct.CondObsMatrix(c, iObs))
                if any(obsStruct.idScale==iObs)
                    fprintf(fileID, 'scale%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                            obsStruct.CondObsMatrix(c, iObs), obsNames{iObs}, 0, 1, 1, -5, 5);
                end
                if any(obsStruct.idOffset==iObs)
                    fprintf(fileID, 'offset%i_%s\t%f\t%i\t%i\t%i\t%i\n', ...
                        obsStruct.CondObsMatrix(c, iObs), obsNames{iObs}, 0, 1, 1, -5, 5);
                end
            end
        end
    end

    fclose(fileID);

end

fprintf('New observables written to data.def files.\n')

end