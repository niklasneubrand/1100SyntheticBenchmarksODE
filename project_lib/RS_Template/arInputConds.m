% this function identifies returns the input functions that are conditions specific

function inputConds = arInputConds(m)

arguments
    m (1,1) double = 1
end

global ar

% get the inputs from the model.def file
u = ar.model(m).u;
fu = ar.model(m).fu;

% loop through the conditions and identify the inputs that are condition specific
inputConds = struct();
nConds = length(ar.model(m).condition);
for c = 1:nConds
    inputConds(c).u = {};
    inputConds(c).fu = {};

    fuCond = ar.model(m).condition(c).fu;
    % loop through inputs
    for i = 1:length(u)
        if ~strcmp(fu{i}, fuCond{i})
            inputConds(c).u{end+1} = u{i};
            inputConds(c).fu{end+1} = fuCond{i};
        end
    end
end

end