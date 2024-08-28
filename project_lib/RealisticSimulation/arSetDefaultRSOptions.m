function RSOptions = arSetDefaultRSOptions(RSOptions)
% ARSETDEFAULTRESOPTIONS  sets missing fields of RSOptions to default values
%

arguments
    RSOptions (1,1) struct = struct()
end

%% Define default options
RSDefault = struct();

% base model
RSDefault.loadPattern = 'normal';           % pattern to load the model
RSDefault.includeCustomSettings = true;     % copy custom settings from base model (or use default ar.config)

% randomization
RSDefault.rngSeed = 'shuffle';              % seed for random number generator (or 'shuffle' for random seed)
RSDefault.seedStep = 1000;                  % in arManyRealisticDesigns, increase seed by this amount for next RS
RSDefault.qSetPars = true;                  % set random parameters

% observable options
RSDefault.inclDynRatio = 0;                 % threshold for dynamical ratio (0 to include all [even const] states)
RSDefault.replaceConstObs = 'all';          % replace constant observables with new obs ('no', 'minimal', 'all')
RSDefault.qLogObs = true;                   % draw randomly if observables are on log scale 


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
