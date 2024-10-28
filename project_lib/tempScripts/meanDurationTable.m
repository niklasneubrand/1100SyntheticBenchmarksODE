function meanDurationTable(problemSet)
    % Calculate mean durations for each problem in the specified problem set directory

    % Get a list of all problem folders
    problemFolders = dir(fullfile('RS_IMBI', problemSet, '*'));

    % Initialize a results table
    results = table('Size', [0 2], 'VariableTypes', {'string', 'duration'}, ...
                    'VariableNames', {'ProblemName', 'MeanDuration'});

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

        % Loop through each report file
        for j = 1:length(reportFiles)
            % Read the CSV file
            reportData = readtable(fullfile(reportFolder, reportFiles(j).name));
            
            % Check if duration column is in string format and convert to duration if necessary
            if iscell(reportData.duration) || isstring(reportData.duration)
                reportData.duration = duration(reportData.duration, 'InputFormat', 'hh:mm:ss');
            end

            % Filter rows where success == 1
            successfulRows = reportData.success == 1;

            % Accumulate the total duration and count of successful rows
            totalDuration = totalDuration + sum(reportData.duration(successfulRows));
            successCount = successCount + sum(successfulRows);
        end

        % Calculate the mean duration for the current problem
        if successCount > 0
            meanDuration = totalDuration / successCount;
        else
            meanDuration = duration(0, 0, 0); % Default to 0 if no successes
        end

        % Append the result for the current problem to the results table
        results = [results; {problemName, meanDuration}];
    end

    % Save the results table as a CSV file
    writetable(results, sprintf('meanRSDurations_%s.csv', problemSet));
end
