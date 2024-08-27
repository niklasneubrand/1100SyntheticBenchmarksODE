%% collect the data from the ar structs

baseModelsFastDir = "C:\Users\neubrand\Documents\d2d\projects\RealisticBenchmarks\BaseModels\fast";
folders = dir(baseModelsFastDir);
folders = folders(3:end);
folderDirs = {folders.folder};
folderNames = {folders.name};

baseModelsSlowDir = "C:\Users\neubrand\Documents\d2d\projects\RealisticBenchmarks\BaseModels\slow";
folders = dir(baseModelsSlowDir);
folders = folders(3:end);
folderDirs = [folderDirs, {folders.folder}];
folderNames = [folderNames, {folders.name}];

dynStates = struct();

for ii=1:length(folderNames)
    cd(fullfile(folderDirs{ii}, folderNames{ii}))
    loaded = arLoadLatest('normal');
    if ~loaded
        continue
    end
    try
        load("RSTemplate/RSTemplate.mat")
    catch
        RSTemplate = arCreateRSTemplate(true, false, true);
    end
    
    [~, ratioDynCurves] = arDynCondStates(1, RSTemplate, 1);
    dynStates(ii).modelName = string(ar.info.name);
    dynStates(ii).ratioDynCurves = {ratioDynCurves};

end

% remove models that did not load
idx = cellfun(@isempty, {dynStates.ratioDynCurves});
dynStates(idx) = [];

cd(startDir);


%% plot the results
% We introduce the variable 'inclRatio' to filter out states that do not show
% dynamics in less than 'inclRatio' of the experiments.
% we want to number of included states for each model in dependence of
% the variable 'inclRatio' ranging from 0 to 1.

inclRatio = 0:0.01:1;

figure();

for ii=1:length(dynStates)
    ratioDynCurves = dynStates(ii).ratioDynCurves{1};
    nStates = length(ratioDynCurves);
    inclStates = zeros(1, length(inclRatio));
    for jj=1:length(inclRatio)
        inclStates(jj) = sum(ratioDynCurves >= inclRatio(jj));
    end
    
    if ii<=7
        ls = '--';
    elseif ii<=14
        ls = ':';
    elseif ii<=21
        ls = '-.';
    else
        ls = '-';
    end

    plot(inclRatio, inclStates, ...
        'DisplayName', dynStates(ii).modelName, ...
        'LineWidth', 1.5, 'LineStyle', ls)
    hold on
end
hold off

xlim([0, 1])

title('Number of Included States')
xlabel('cutoff for ratio of dynamic experiments')
ylabel('number of included states')
legend('Location', 'eastoutside', 'Interpreter','none')

% save the figure
savefig('numberIncludedStates.fig')


%% Plot 2: Ratio of included States

inclRatio = 0:0.01:1;

figure();

for ii=1:length(dynStates)
    ratioDynCurves = dynStates(ii).ratioDynCurves{1};
    nStates = length(ratioDynCurves);
    inclStates = zeros(1, length(inclRatio));
    for jj=1:length(inclRatio)
        inclStates(jj) = sum(ratioDynCurves >= inclRatio(jj));
    end
    
    if ii<=7
        ls = '--';
    elseif ii<=14
        ls = ':';
    elseif ii<=21
        ls = '-.';
    else
        ls = '-';
    end

    plot(inclRatio, inclStates/nStates, ...
        'DisplayName', dynStates(ii).modelName, ...
        'LineWidth', 1.5, 'LineStyle', ls)
    hold on
end
hold off

xlim([0, 1])
ylim([0, 1])

title('Ratio of Included States')
xlabel('cutoff for ratio of dynamic experiments')
ylabel('ratio of included states')
legend('Location', 'eastoutside', 'Interpreter','none')

% save the figure
savefig('ratioIncludedStates.fig')

%% Second figure: What is the ration of dynamic Experiments for the included states?
% We want to plot the mean ratio of dynamic experiments for the included states in
% dependence of the variable 'inclRatio' ranging from 0 to 1.

figure();

for ii=1:length(dynStates)
    ratioDynCurves = dynStates(ii).ratioDynCurves{1};
    nStates = length(ratioDynCurves);
    inclDynRatio = zeros(1, length(inclRatio));
    for jj=1:length(inclRatio)
        inclDynRatio(jj) = mean(ratioDynCurves(ratioDynCurves >= inclRatio(jj)));
    end

    if ii<=7
        ls = '--';
    elseif ii<=14
        ls = ':';
    elseif ii<=21
        ls = '-.';
    else
        ls = '-';
    end

    plot(inclRatio, inclDynRatio, ...
        'DisplayName', dynStates(ii).modelName, ...
        'LineWidth', 1.5, 'LineStyle', ls)
    hold on
end
hold off

xlim([0, 1])
ylim([0, 1])

title('Ratio of Dynamic Experiments for Included States')
xlabel('cutoff for ratio of dynamic experiments')
ylabel('mean ratio of dynamic experiments')
legend('Location', 'eastoutside', 'Interpreter','none')

% save the figure
savefig('ratioDynamicExperiments.fig')


%% Third figure: 