function [stateStrings, paramsStrings] = arObsStringRepresent(m, setting, index)

arguments
    m (1,1) double  = 1
    setting (1,1) string = "all"
    index (1,:) double  = NaN
end

global ar

if ~strcmp(setting, 'all') && any(isnan(index))
    setting = 'all';
    warning('No index provided. Switching to setting ''all''.');
end

% get all observables fy and obersvable parameters py
% for the given setting
switch setting
    case 'all'
        fy = unique(vertcat(ar.model(m).data(:).fy));
        py = unique(vertcat(ar.model(m).data(:).py));
    case {'condition', 'cond', 'c'}
        fy = unique(vertcat(ar.model(m).data([ar.model(m).condition(index).dLink]).fy));
        py = unique(vertcat(ar.model(m).data([ar.model(m).condition(index).dLink]).py));
    case {'data', 'd'}
        fy = unique(vertcat(ar.model(m).data(index).fy));
        py = unique(vertcat(ar.model(m).data(index).py));
    otherwise
        error('Unknown setting. Use ''all'', ''condition'' or ''data''.')
end

xModel = ar.model(m).x;
zModel = ar.model(m).z;
fzModel = ar.model(m).fz;

% characterize the obersvables in the condition
[~, ~, ~, params] = arObsParamRelation(fy, py, zModel, fzModel);
[~, states] = arObsStateRelation(fy, xModel, zModel, fzModel);


%% this is not right yet.
% need to think about handeling emtpy sets of params and states
for i=1:length(params)
    if isempty(params{i})
        params{i} = "";
    else
        params{i} = string(params{i});
    end
end


% get states
stateStrings = cellfun(@(x) join(string(x), '+'), states);
paramsStrings = cellfun(@(x) join(string(x), '+'), params);

end