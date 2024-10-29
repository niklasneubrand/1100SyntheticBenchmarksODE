function summarizeRSResults()
    % Define the problem sets to analyze
    problemSets = {'fast2_V1', 'slow2_V1'};
    
    % Initialize a results table with an additional column for success percentage
    results = table('Size', [0 7], 'VariableTypes', {'string', 'string', 'double', 'int32', 'int32', 'duration', 'string'}, ...
                    'VariableNames', {'ProblemName', 'ProblemSet', 'SuccessPercentage', 'nSuccess', 'nFinished', 'MeanDuration', 'Problems'});

    % Loop through each problem set
    for k = 1:length(problemSets)
        problemSet = problemSets{k};
        
        % Get a list of all problem folders
        problemFolders = dir(fullfile('RS_IMBI', problemSet, '*'));

        % Loop through each problem folder
        for i = 1:length(problemFolders)
            % Skip if not a directory or is '.' or '..'
            if ~problemFolders(i).isdir || ismember(problemFolders(i).name, {'.', '..'})
                continue;
            end

            % Get the name of the problem folder
            problemName = problemFolders(i).name;
            % Path to the RealisticSimulation folder
            reportFolder = fullfile('RS_IMBI', problemSet, problemName, 'RealisticSimulation', '0_info_manyRS');

            % Get all report files in the current problem's RealisticSimulation folder
            reportFiles = dir(fullfile(reportFolder, 'report_manyRS_*.csv'));

            % Initialize variables for accumulating durations and counts
            totalDuration = duration(0,0,0);
            successCount = 0;
            finishedCount = 0;
            unsuccessfulProblems = {};

            % Loop through each report file
            for j = 1:length(reportFiles)
                % Read the CSV file
                reportData = readtable(fullfile(reportFolder, reportFiles(j).name));
                
                % Convert the duration column to duration format if necessary
                if iscell(reportData.duration) || isstring(reportData.duration)
                    reportData.duration = duration(reportData.duration, 'InputFormat', 'hh:mm:ss');
                end

                % Filter rows for successful simulations
                successfulRows = reportData.success == 1;
                successCount = successCount + sum(successfulRows);
                finishedCount = finishedCount + height(reportData); % Total number of simulations

                % Accumulate durations for successful simulations
                totalDuration = totalDuration + sum(reportData.duration(successfulRows));

                % Track specific failed simulations in 'Problems' column
                failedRows = reportData.success == 0;
                if any(failedRows)
                    failedSimulations = reportData.projectName(failedRows); % Store failed simulation names
                    unsuccessfulProblems = [unsuccessfulProblems; failedSimulations];
                end
            end

            % Calculate the mean duration for the current problem
            if successCount > 0
                meanDuration = totalDuration / successCount;
            else
                meanDuration = duration(0, 0, 0); % Default to 0 if no successes
            end

            % Calculate success percentage
            if finishedCount > 0
                successPercentage = round((successCount / finishedCount) * 100);
            else
                successPercentage = 0; % No simulations
            end

            % Join failed simulations into a single string
            problemsList = strjoin(unsuccessfulProblems, ', ');

            % Create a row for the results table
            results = [results; {problemName, problemSet, successPercentage, successCount, finishedCount, meanDuration, problemsList}];
        end
    end

    % Add a blank row
    results = [results; {'' '' NaN NaN NaN duration(NaN, NaN, NaN) ''}];

    % Calculate summary statistics
    totalSuccess = sum(results.nSuccess, 'omitnan');
    totalFinished = sum(results.nFinished, 'omitnan');
    summarySuccessPercentage = round((totalSuccess / totalFinished) * 100);
    summaryMeanDuration = mean(results.MeanDuration, 'omitnan');

    % Add the summary row
    summaryRow = {'Summary', '', summarySuccessPercentage, totalSuccess, totalFinished, summaryMeanDuration, ''};
    results = [results; summaryRow];

    % Save the results table as a CSV file
    writetable(results, 'RS_IMBI/fast2_slow2_Summary.csv');
end
