function T = structToTableWithCells(S)
    fn = fieldnames(S);
    n = numel(S);
    
    % Preallocate cell array for field values
    data = cell(n, numel(fn));
    
    for i = 1:n
        for j = 1:numel(fn)
            val = S(i).(fn{j});
            if ischar(val)
                data{i,j} = string(val);  % convert char array to string
            elseif isnumeric(val) && ~isscalar(val)
                data{i,j} = {val};        % wrap non-scalar numeric in cell
            else
                data{i,j} = val;          % leave other types as-is
            end
        end
    end
    
    % Create table
    T = cell2table(data, 'VariableNames', fn);
end
