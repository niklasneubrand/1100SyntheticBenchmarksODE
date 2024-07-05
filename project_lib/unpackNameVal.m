function nameValCell = unpackNameVal(s)
    fields = fieldnames(s);
    values = struct2cell(s);
    nameValCell = cell(1, 2*numel(fields));
    nameValCell(1:2:end) = fields;
    nameValCell(2:2:end) = values;
end