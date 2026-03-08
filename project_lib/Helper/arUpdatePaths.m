function arUpdatePaths()
% ARUPDATEPATHS updates model and data paths in the ar struct.
% This can be useful after moving the project folder to a different location.

global ar

ar.info.ar_path = fileparts(which('arInit'));

arInfoPathOld = ar.info.path;
ar.info.path = pwd();

for m = 1:length(ar.model)
    mPathOld = ar.model(m).path;
    mPathOldParts = split(mPathOld, arInfoPathOld);
    if length(mPathOldParts) == 2
        ar.model(m).path = fullfile(ar.info.path, mPathOldParts{2});
    else
        ar.model(m).path = fullfile(ar.info.path, 'Models');
    end
end

for m = 1:length(ar.model)
    for d = 1:length(ar.model(m).data)
        dPathOld = ar.model(m).data(d).path;
        dPathOldParts = split(dPathOld, arInfoPathOld);
        if length(dPathOldParts) == 2
            ar.model(m).data(d).path = fullfile(ar.info.path, dPathOldParts{2});
        else
            ar.model(m).data(d).path = fullfile(ar.info.path, 'Data');
        end
    end
end