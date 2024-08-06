function arWriteAuxillaryData(projectName, projectPath, obsStruct, template)

global ar  %#ok<GVMIS>

obsNames = obsStruct.obsNames;
nTC = template.nTC;
nDR = template.nDR;

%% dummy data for time courses (for convenience)
for tc = 1:nTC

    % table header
    tVar = {ar.model.t};
    obs = obsNames(~isnan(obsStruct.paramIndices(tc, :)));
    tableHeader = [tVar, obs];

    % table content
    nObs = length(obs);
    dummyCell = num2cell(1+rand(1, nObs+1));
    tLim = max([ar.model.data(template.timeCourse(tc).dLink).tLim], [], 'all');
    dummyCell(:, 1) = {tLim};

    % create table and store to file
    dummyData = cell2table(dummyCell, "VariableNames", tableHeader);
    filePath = fullfile(projectPath, 'Data', sprintf('%s_TC%d_auxillary.csv', projectName, tc));
    writetable(dummyData, filePath);

end


%% For dose response we also need dummy data files
% reason: the dose response datafiles contain condition information.
% without data files there are not multiple doses, thus not multiple conditions
for dr = 1:nDR

    % get the data link(s)
    d = template.doseResponse(dr).dLink;

    % table header
    tVar = {ar.model.t};
    respVar = {template.doseResponse(dr).response_parameter};
    obs = obsNames(~isnan(obsStruct.paramIndices(nTC + dr, :)));
    tableHeader = [tVar, respVar, obs];

    % table content
    nData = length(d);
    nObs = length(obs);
    dummyCell = cell(nData, nObs+2);
    dummyCell(:, 1) = {template.doseResponse(dr).tExp};
    dummyCell(:, 2) = num2cell(template.doseResponse(dr).values');
    dummyCell(:, 3:end) = num2cell(1+rand(nData, nObs));

    % create table and store to file
    dummyData = cell2table(dummyCell, "VariableNames", tableHeader);
    filePath = fullfile(projectPath, 'Data', sprintf('%s_DR%d_auxillary.csv', projectName, dr));
    writetable(dummyData, filePath);

end


end