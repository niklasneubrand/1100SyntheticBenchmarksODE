% load custom configs
load('allCustomConfigs.mat')

allConfigs = allCustomConfigsTab;

% insert default values
arInit;
allConfigs.atol(isnan(allConfigs.atol)) = ar.config.atol;
allConfigs.rtol(isnan(allConfigs.rtol)) = ar.config.rtol;
allConfigs.eq_tol(isnan(allConfigs.eq_tol)) = ar.config.eq_tol;
allConfigs.maxsteps(isnan(allConfigs.maxsteps)) = ar.config.maxsteps;
allConfigs.add_c(isnan(allConfigs.add_c)) = ar.config.add_c;
allConfigs.atolV(isnan(allConfigs.atolV)) = ar.config.atolV;
allConfigs.atolV_Sens(isnan(allConfigs.atolV_Sens)) = ar.config.atolV_Sens;

%% summarize
sCustom = summary(allCustomConfigsTab);
sAll = summary(allConfigs);
summary(allConfigs)

% only hass uses vector tolerances
unique(allCustomConfigsTab{~isnan(allCustomConfigsTab.atolV), "templateName"});



