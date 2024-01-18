function arRealisticData(randomSeed)


arguments
    randomSeed (1,:) = 'shuffle'
end

global ar

%% simulate data
for m=1:length(ar.model.data)
    % arSimuData arguments:
    % jplot=[]  -> loop through all plots (hence through all data sets)
    % tT=[]     -> time points from ar, already set in arRealisticTimesRTF
    arSimuData(m, [], [], randomSeed);
end

%% overwrite experimental error bars (have to be fitted)
for m=1:length(ar.model)
    for d=1:length(ar.model(m).data)
        ar.model(m).data(d).yExpStd = nan(size(ar.model(m).data(d).yExp));
    end
end


%% save the data as xls files
for m=1:length(ar.model)
    for d=1:length(ar.model(m).data)
        
        header = ['t', ar.model(m).data(d).y];
        data = num2cell([ar.model(m).data(d).tExp, ar.model(m).data(d).yExp]);
        filePath = fullfile('Data', sprintf('RealisticData_M%d_D%d.xls', m, d));
        writecell([header; data], filePath);
        
    end
end

arLink();

end



%% deprectated code snippets

%% 1. loading tT from file
% load time points from file
% tT = readmatrix(sprintf('RealisticDesign/TimePoints_M%d_D%d.txt', m, d));
% ar.model(m).data(d).tT = tT;

% tT still would have to be tranformed into the right format:
% y = nan(size(tT));
% y(~isnan(tT)) = 1;
% [tExp,yExp] = artExpToVector(tT,y);
% ar.model(m).data(d).tExp = tExp;


%% 2. The function "artExpToVector" also replaces small y values by thresholds.
%     I do not understand how it works (the logic is strange).
%     Since restructuring the code a call to this function is not necessary anymore.
%     But if we would like to call this function anyways, we would have to
%     modify the data format of the simulated data in the following way:

% % transform simulated data back to tT format
% y = nan(size(tT));
% for i = 1:size(tT,2)
%     y(~isnan(tT(:, i)), i) = yExp(~isnan(yExp(:, i)), i);
% end
        
% % transform simulatedc data from tT format to tExp format
% [tExp,yExp] = artExpToVector(tT,y);
        
% writecell(...
%     [['t', ar.model(m).data(d).y];num2cell([tExp,yExp])], ...
%     fullfile('Data', sprintf('RealisticData_M%d_D%d.xls', m, d)));

        
%% 3. write data to ar structure (this is already done in arRealisticTimesRTF and arSimuData)
% ar.model(m).data(d).tExp = tExp;                % simulated time points
% ar.model(m).data(d).tT = tT;                    % simulated time points
% ar.model(m).data(d).yExp = yExp;                % simulated data
% ar.model(m).data(d).yExpStd = nan(size(yExp));  % errors have to be fitted