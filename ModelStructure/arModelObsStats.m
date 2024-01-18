function modelStructure = arModelObsStats()

global ar %#ok<*GVMIS>

iMod = 1;  % only consider first model (usually there is only one model anyway)

modelStructure = table();


for iCond=1:length(ar.model(iMod).condition)

    condStructure = arCondObsStats(iMod, iCond);

    tmpStructure = table();

    tmpStructure.nObs = size(condStructure, 1);
    tmpStructure.nUniqueObs = length(unique(vertcat(ar.model(iMod).data(ar.model(iMod).condition(iCond).dLink).fy)));
    tmpStructure.nScale = sum(condStructure.qScale);
    tmpStructure.nOffset = sum(condStructure.qOffset);
    tmpStructure.nComp = sum(condStructure.qComp);
    tmpStructure.meanCompSize = mean(condStructure.nStates(condStructure.qComp));
    tmpStructure.nUniqueStates = length(unique(horzcat(condStructure.states{:})));
    tmpStructure.nUniqueStateSets = length(unique(cellfun(@(x)join(x,'+'), condStructure.states)));

    modelStructure = [modelStructure; tmpStructure]; %#ok<AGROW>
end

% table properties
modelStructure.Properties.RowNames = string(1:size(modelStructure, 1));
modelStructure.Properties.DimensionNames = {'Condition', 'Characteristics'};


end