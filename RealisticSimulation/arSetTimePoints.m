function tT = arSetTimePoints(transPars, iModel, iData, convertt, folder_name, randomSeed)

arguments
    transPars (:,:) table
    iModel (1,1) double {mustBeInteger, mustBePositive} = 1
    iData (1,1) double {mustBeInteger, mustBePositive} = 1
    convertt (:,:) double {mustBeNumeric, mustBePositive} = 1
    folder_name (1,:) char {mustBeText} = ''
    randomSeed (1,:) = 'shuffle'
end

global ar

nx = length(ar.model(iModel).x);
ny = length(ar.model(iModel).data(iData).y);

rng(randomSeed);

sust_times_trans = transPars.timescale_sust.*transPars.timescale_trans;
max_sus_model = nanmax(transPars.timescale_sust);
max_tr_model = nanmax(transPars.timescale_trans);
min_sus_model = nanmin(transPars.timescale_sust);
min_tr_model = nanmin(transPars.timescale_trans);

% aus 2017
%T = 1.76 + 0.15*tsus + 0.24*ttrans -0.03*tsus.*ttrans+0.01*toff;
%n = ceil(10.^(1.04 -0.07*tsus + 0.06*ttrans -0.01*tsus.*ttrans));
% 2022:
T =      10.^(2.17 +0.00034*transPars.toffset_TF +0.0035/nx +0.014/ny +0.011*transPars.amp_sust -0.022*transPars.amp_trans +0.67*min_sus_model +0.08*min_tr_model +0.03*transPars.timescale_sust +0.143*transPars.timescale_trans +0.03*sust_times_trans +randn(size(transPars,1),1)*0.03); % 0.3
n = round(10.^(1.04 -0.00032*transPars.toffset_TF +0.0015/nx -0.016/ny +0.013*transPars.amp_trans -0.07*max_sus_model +0.07*max_tr_model +0.049*transPars.timescale_sust +0.05*transPars.timescale_trans -0.033*sust_times_trans +randn(size(transPars,1),1)*0.02)); % 0.2
lambda =  0.667 -0.00017*transPars.toffset_TF -0.0038/nx +0.0039/ny -0.013*transPars.amp_trans -0.121*max_sus_model +0.086*max_tr_model -0.04*transPars.timescale_trans      +randn(size(transPars,1),1)*0.01;
potenz =  1.75 +0.00022*transPars.toffset_TF +0.0086/nx -0.009/ny +0.036*transPars.amp_trans +0.14*max_sus_model -0.18*max_tr_model +0.08*transPars.timescale_sust +0.14*transPars.timescale_trans -0.032*sust_times_trans +randn(size(transPars,1),1)*0.03;
% nur observable variable, not model parameter
T =      10.^(1.58 +0.00151*transPars.toffset_TF -0.0046/nx +0.016/ny -0.019*transPars.amp_trans +0.13*transPars.timescale_sust +0.28*transPars.timescale_trans +0.042*sust_times_trans +randn(size(transPars,1),1)*0.04); % 0.3
n = round(10.^(1.02 -0.00029*transPars.toffset_TF +0.0016/nx -0.014/ny +0.015*transPars.amp_trans +0.037*transPars.timescale_sust +0.059*transPars.timescale_trans -0.03*sust_times_trans +randn(size(transPars,1),1)*0.02)); % 0.2
lambda =  0.616 -0.00015*transPars.toffset_TF -0.0039/nx +0.0063/ny -0.006*transPars.amp_sust -0.006*transPars.amp_trans -0.014*transPars.timescale_sust -0.044*transPars.timescale_trans     +randn(size(transPars,1),1)*0.01;
potenz =  1.73 +0.0073/nx -0.013/ny +0.031*transPars.amp_trans +0.08*transPars.timescale_sust +0.098*transPars.timescale_trans -0.035*sust_times_trans +randn(size(transPars,1),1)*0.04;

tT = nan(max(n),length(T));
for k = 1:length(T)
    x = linspace(0,1,n(k));
    tT(1:n(k),k) = (lambda(k).*x+(1-lambda(k)).*x.*((exp(log(2)*x)-1).^potenz(k))).*T(k);
end

tT = tT./convertt'; % biomodel was scaled to range(t)>10 || <100

%tT = round(tT,2,'significant');
mag = 10.^(8:-1:-8);
for i=1:length(mag)
    tT(tT>mag(i)) = round(tT(tT>mag(i))*2,-log10(mag(i)))/2;
end


% dummy values for data
y = nan(size(tT));
y(~isnan(tT)) = 1;

% convert time data format
[tExp,yExp] = artExpToVector(tT,y);
        
% save data to ar structure
ar.model(iModel).data(iData).tT = tT;                   % time points for each observable
ar.model(iModel).data(iData).tExp = tExp;               % time points combined
ar.model(iModel).data(iData).yExp = yExp;               % dummy values
ar.model(iModel).data(iData).yExpStd = nan(size(yExp)); % errors have to be fitted

arLink();


writematrix(tT, sprintf('RealisticDesign/TimePoints_M%d_D%d.txt', iModel, iData));
fprintf('Realistic time Points are assigned.\n');    
    
end

