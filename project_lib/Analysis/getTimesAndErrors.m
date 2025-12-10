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

% get Time units
timeUnit = string(ar.model.tUnits{2});
if strcmp(timeUnit, 'n/a')
    % I check this: all missings are in minutes
    timeUnit = "min";
end

% transform time to minutes if necessary
if strcmp(timeUnit, 's')
    allTimes = allTimes / 60;  % convert seconds to minutes
    medTime = medTime / 60;
    meanTime = meanTime / 60;
    medUniqueTime = medUniqueTime / 60;
    meanUniqueTime = meanUniqueTime / 60;
elseif strcmp(timeUnit, 'h')
    allTimes = allTimes * 60;  % convert hours to minutes
    medTime = medTime * 60;
    meanTime = meanTime * 60;
    medUniqueTime = medUniqueTime * 60;
    meanUniqueTime = meanUniqueTime * 60;
end

%% get relative errors (based on experimental data and errors [if available])
try
    arSimu(1,0,1)
    arSimu(1,1,1)
catch ME
    fprintf("Error during simulation: %s\n", ME.message);
end

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
    relErr(:, qLog10) = abs(yStd(:, qLog10));
    relErr(:, ~qLog10) = abs(yStd(:, ~qLog10) ./ yExp(:, ~qLog10));

    % remove empty data entries and flatten the data
    relErr(noData) = [];
    relErr = relErr(:);
    allErrors = [allErrors; relErr];
end

% statistics of the relative errors
medErrorExp = median(allErrors);
meanErrorExp = mean(allErrors);

medLog10ErrExp = median(log10(allErrors));
meanLog10ErrExp = mean(log10(allErrors));

%% get relative errors (based on simulated data and errors)

allErrors = [];
for d = 1:length(ar.model.data)

    % get simulated data
    ySimu = ar.model.data(d).yExpSimu;
    noData = isnan(ySimu);

    % get standard deviations (measured and simulated)
    yStd = ar.model.data(d).yExpStd;
    noExpErrors = isnan(yStd);
    yStd(noExpErrors) = ar.model.data(d).ystdExpSimu(noExpErrors);

    % calculate relative errors
    relErr = NaN(size(ySimu));

    % handle log and linear fitting
    qLog10 = logical(ar.model.data(d).logfitting);
    relErr(:, qLog10) = abs(yStd(:, qLog10));
    relErr(:, ~qLog10) = abs(yStd(:, ~qLog10) ./ ySimu(:, ~qLog10));

    % remove empty data entries and flatten the data
    relErr(noData) = [];
    relErr = relErr(:);
    allErrors = [allErrors; relErr];
end

% statistics of the relative errors
medErrorSimu = median(allErrors);
meanErrorSimu = mean(allErrors);

medLog10ErrSimu = median(log10(allErrors));
meanLog10ErrSimu = mean(log10(allErrors));

%% create output table
output = struct();

output.projectName = projectName;
output.templateName = templateName;

output.medTime = medTime;
output.meanTime = meanTime;
output.medUniqueTime = medUniqueTime;
output.meanUniqueTime = meanUniqueTime;
output.timeUnit = timeUnit;

output.medErrorExp = medErrorExp;
output.meanErrorExp = meanErrorExp;
output.medLog10ErrExp = medLog10ErrExp;
output.meanLog10ErrExp = meanLog10ErrExp;

output.medErrorSimu = medErrorSimu;
output.meanErrorSimu = meanErrorSimu;
output.medLog10ErrSimu = medLog10ErrSimu;
output.meanLog10ErrSimu = meanLog10ErrSimu;

output = struct2table(output);

end