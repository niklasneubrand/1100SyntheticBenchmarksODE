function arConfigReset()

global ar

% remember original ar struct
arModel = arDeepCopy(ar);

% initialize emtpy ar struct
arInit
defaultConfigs = arDeepCopy(ar.config);

% restore original ar struct
ar = arDeepCopy(arModel);

% replace ar.config with default configs
% attention: the default does not contain all necessary fields
% and some configs should not be overwriten

excludeConfigs = {'savepath', 'nCore', 'nParallel', 'nMaxThreads'};  % can be extended in the future

defaultConfigNames = fieldnames(defaultConfigs);
for i = 1:length(defaultConfigNames)
    configName = defaultConfigNames{i};
    if ~ismember(configName, excludeConfigs) && isfield(ar.config, configName)
        ar.config.(configName) = defaultConfigs.(configName);
    end
end

end