function condStructure = arCondStructure(iMod, iCond)

global ar

% get all observables fy and obersvable parameters py for this condition
fyCond = unique(vertcat(ar.model(iMod).data(ar.model(iMod).condition(iCond).dLink).fy));
pyCond = unique(vertcat(ar.model(iMod).data(ar.model(iMod).condition(iCond).dLink).py));
xModel = ar.model(iMod).x;
zModel = ar.model(iMod).z;
fzModel = ar.model(iMod).fz;

% characterize the obersvables in the condition
[nPars, offset, scale] = arObsParamRelation(fyCond, pyCond, zModel, fzModel);
[nStates, states] = arObsStateRelation(fyCond, xModel, zModel, fzModel);

condStructure = table();
% condStructure.iCond = iCond;
condStructure.nPars = nPars';
condStructure.qOffset = cellfun(@(x) ~isempty(x), offset');
condStructure.qScale = cellfun(@(x) ~isempty(x), scale');
condStructure.qComp = arrayfun(@(x) x >= 2, nStates');
condStructure.nStates = nStates';
condStructure.states = states';

% table properties
condStructure.Properties.RowNames = string(1:size(condStructure, 1));
condStructure.Properties.DimensionNames = {'Observable', 'Characteristics'};

end