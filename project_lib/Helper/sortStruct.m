% function struct = sortStruct(struct)
%
% Sorts a struct recursively by fieldnames

function struct = sortStruct(struct)
struct = orderfields(struct);
fields = fieldnames(struct);
for i=1:length(fields)
    if isstruct(struct.(fields{i}))
        for j=1:length(struct.(fields{i}))
            struct.(fields{i})(j) = sortStruct(struct.(fields{i})(j));
        end
    end
end
end