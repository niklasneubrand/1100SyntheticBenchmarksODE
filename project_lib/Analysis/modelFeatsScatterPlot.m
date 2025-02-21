function modelFeatsScatterPlot(baseModelsTable, simulationsTable, varSubset, qLog10)

arguments
    baseModelsTable table
    simulationsTable table
    varSubset cell = {'nParamsFit', 'nDataPoints', 'nObsSets', 'designSparsity'}
    qLog10 double = ones(size(varSubset))
end


% Define variables
baseModels = baseModelsTable.baseModelName;
numBaseModels = height(baseModelsTable);
varSubset = [{'modelName', 'baseModelName'}, varSubset];
baseModelsTable = baseModelsTable(:, varSubset);
simulationsTable = simulationsTable(:, varSubset);
variableNames = baseModelsTable.Properties.VariableNames;
numVars = length(variableNames);

% log transform variables
for i = 3:numVars
    if qLog10(i-2)
        baseModelsTable.(variableNames{i}) = log10(baseModelsTable.(variableNames{i}));
        simulationsTable.(variableNames{i}) = log10(simulationsTable.(variableNames{i}));
    end
end

% Assign unique colors to each base model
colors = lines(numBaseModels); % You can replace this with another colormap if desired
markers = [repmat({'o'}, 1, 7), repmat({'square'}, 1, 7), repmat({'^'}, 1, 7)];


% Loop through each pair of variables to create scatter plots
for varX = 3:numVars
    for varY = varX+1:numVars

        figure;

        plots = [];

        % Loop through each base model
        for i = 1:numBaseModels

            % Extract base model values
            baseModelData = baseModelsTable(i, :);
            % Extract corresponding simulations
            simulationsData = simulationsTable(strcmp(simulationsTable.baseModelName, baseModels{i}), :);

            % Plot simulations as small, semi-transparent dots
            scatter(simulationsData{:,varX}, simulationsData{:,varY}, 20, colors(i, :), 'filled', 'MarkerFaceAlpha', 0.2, 'Marker', markers(i));
            hold on;
            % Plot base model as a large, solid dot
            plots(end+1) = scatter(baseModelData{1, varX}, baseModelData{1, varY}, 50, colors(i, :), 'filled', 'MarkerEdgeColor', 'k', 'Marker', markers(i));

        end

        % Create legend showing which color corresponds to which base model
        lgd = legend(plots, baseModels, ...
            'Location', 'bestoutside');
        title(lgd, 'Simulation Template')

        % Set labels and titles
        if qLog10(varX-2)
            xlabel(sprintf('%s [log10]', variableNames{varX}));
        else
            xlabel(variableNames{varX});
        end
        if qLog10(varY-2)
            ylabel(sprintf('%s [log10]', variableNames{varY}));
        else
            ylabel(variableNames{varY});
        end
        title('Scatter plot of Model Characteristics');

    end
end

end
