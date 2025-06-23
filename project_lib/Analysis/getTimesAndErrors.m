function output = getTimesAndErrors()

global ar

%% define the project and template name
projectName = string(ar.info.name);
nameParts = split(projectName, '_', 2);
templateName = string(nameParts(1));

%% get all times
allTimes = [];
for d = 1:length(ar.model.data)
    tExp = repmat(ar.model.data(d).tExp, size(ar.model.data(d).y));
    noData = isnan(ar.model.data(d).yExp);
    tExp(noData) = [];
    tExp = tExp(:);  % flatten the time vector
    allTimes = [allTimes; tExp];
end

% statistics of all times (captures time scales and variability of the model)
medTime = median(allTimes);
meanTime = mean(allTimes);

% statistics of unique times (captures time scales of the model)
medUniqueTime = median(unique(allTimes));
meanUniqueTime = mean(unique(allTimes));


%% get relative errors
arSimu(1,0,1)

allErrors = [];
for d = 1:length(ar.model.data)

    % get experimental data
    yExp = ar.model.data(d).yExp;
    noData = isnan(yExp);

    % get standard deviations (measured and simulated)
    yStd = ar.model.data(d).yExpStd;
    noExpErrors = isnan(yStd);
    yStd(noExpErrors) = ar.model.data(d).ystdExpSimu(noExpErrors);

    % calculate relative errors
    relErr = NaN(size(yExp));

    % handle log and linear fitting
    qLog10 = logical(ar.model.data(d).logfitting);
    relErr(:, qLog10) = yStd(:, qLog10);
    relErr(:, ~qLog10) = yStd(:, ~qLog10) ./ yExp(:, ~qLog10);

    % remove empty data entries and flatten the data
    relErr(noData) = [];
    relErr = relErr(:);
    allErrors = [allErrors; relErr];
end

% statistics of the relative errors
medError = median(allErrors);
meanError = mean(allErrors);

medLog10Err = median(log10(allErrors));
meanLog10Err = mean(log10(allErrors));

%% create output table
output = struct();

output.projectName = projectName;
output.templateName = templateName;

output.medTime = medTime;
output.meanTime = meanTime;
output.medUniqueTime = medUniqueTime;
output.meanUniqueTime = meanUniqueTime;

output.medError = medError;
output.meanError = meanError;
output.medLog10Err = medLog10Err;
output.meanLog10Err = meanLog10Err;

output = struct2table(output);

end