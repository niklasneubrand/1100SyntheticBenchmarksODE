function arWriteDataDef(obsStruct, condStruct, iCond)
% Write obs in RealisticData.def

global ar  %#ok<*GVMIS>

% Data folder
if ~exist(['.' filesep 'Data'],'dir')
    mkdir('Data')
end

%% meaningful filename!
filename = sprintf('RealisticData_Cond%i.def', iCond);
fileID = fopen(fullfile('Data', filename), 'w');

fprintf(fileID, '%s\n', 'DESCRIPTION') ;
fprintf(fileID, '"Realisticly set observables for model condition %i"\n', iCond);

%% add a nice description here !
fprintf(fileID, '\n%s\n', 'PREDICTOR') ;
fprintf(fileID, '\n%s\t%s\t%s\t%s\t%i\t%i\n', ...
        'time', 'T', 'n/a', 'time', 0, ar.model.tLim(2)) ;
fprintf(fileID, '\n%s\n', 'INPUTS') ;

%% Observables
obsNames = cell(1, obsStruct.nObs);
obsExprs = cell(1, obsStruct.nObs);
fprintf(fileID, '\n%s\n', 'OBSERVABLES') ;
for iObs = 1:obsStruct.nObs
    if iObs <= obsStruct.nDirectObs
        % directly observed states
        idObs = obsStruct.idDirectObs(iObs);
        obsNames(iObs) = obsStruct.states(idObs);
        obsExprs(iObs) = obsStruct.states(idObs);
    else
        % compounds
        iComp = iObs - obsStruct.nDirectObs;
        compName = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '_add_');
        if length(compName) > 63
            compName = compName(1:63);
        end
        obsNames{iObs} = compName;
        obsExprs{iObs} = strjoin(obsStruct.states(obsStruct.idComp(iComp, :)), '+');
    end
    % scale and offset parameters
    if any(obsStruct.idScale==iObs)
        % introduce scaling parameter
        obsExprs{iObs} = sprintf('scale_%s*(%s)', obsNames{iObs}, obsExprs{iObs});
        if any(obsStruct.idOffset==iObs)
            % introduce offset parameter
            obsExprs{iObs} = sprintf('offset_%s+%s', obsNames{iObs}, obsExprs{iObs});
        end
    end
    % write to *.def file
    fprintf(fileID, '%s_obs\t%s\t%s\t%s\t%i\t%i\t%s\n', ...
            obsNames{iObs}, 'C', 'n/a', 'conc.', 0, obsStruct.idLog(iObs), obsExprs{iObs});
end

%% Error models
fprintf(fileID, '\n%s\n', 'ERRORS') ;
for iObs = 1:obsStruct.nObs
    fprintf(fileID, '%s_obs\tsd_%s\n', obsNames{iObs}, obsNames{iObs}) ;
end

%% Conditions
fprintf(fileID, '\n%s\n', 'CONDITIONS') ;
replace = condStruct.condReplace{iCond};
for iRep = 1:size(replace, 1)
    fprintf(fileID, '%s\t"%s"\n', replace{iRep, :});
end

fprintf(fileID, '\n%s\n', 'RANDOM') ;

%% Parameters
fprintf(fileID, '\n%s\n', 'PARAMETERS') ;
% initial values
% for i = 1:length(obsStruct.idInit)
%     value = obsStruct.initValues(i);
%     fprintf(fileID, 'init_%s\t%f\t%i\t%i\t%i\t%i\n', ...
%             obsNames{obsStruct.idInit(i)}, value, 1, 1, floor(value-2), ceil(value+2));
% end
% fprintf(fileID, '\n');

% error parameters
for iObs = 1:obsStruct.nObs
    sd = obsStruct.stdObs(iObs);
    fprintf(fileID, 'sd_%s\t%f\t%i\t%i\t%i\t%i\n', ...
            obsNames{iObs}, sd, 1, 1, floor(sd-2), ceil(sd+2));
end

fclose(fileID);

end