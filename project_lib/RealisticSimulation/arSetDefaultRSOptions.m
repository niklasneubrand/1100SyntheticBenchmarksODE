function RSOptions = arSetDefaultRSOptions(RSOptions)
% ARSETDEFAULTRESOPTIONS  sets missing fields of RSOptions to default values
%

arguments
    RSOptions (1,1) struct = struct()
end

%% Define default options
RSDefault = struct();

% base model
RSDefault.loadPattern = 'normal';
RSDefault.includeCustomSettings = true;

% randomization
RSDefault.rngSeed = 'shuffle';
RSDefault.seedStep = 1000;
RSDefault.qSetPars = true;

% observable options
RSDefault.inclDynRatio = 0;
RSDefault.replaceConstObs = 'all';
RSDefault.qLogObs = true;


%% Set missing fields to default values
for field = fieldnames(RSDefault)'
    if ~isfield(RSOptions, field{1})
        RSOptions.(field{1}) = RSDefault.(field{1});
    end
end

%% remove fields that are not in RSDefault
for field = fieldnames(RSOptions)'
    if ~isfield(RSDefault, field{1})
        RSOptions = rmfield(RSOptions, field{1});
    end
end

end
