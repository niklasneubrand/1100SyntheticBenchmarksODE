
function transPars = arTransientPars(iModel, iData)

arguments
    iModel (1,1) double {mustBeInteger,mustBePositive} = 1
    iData (1,1) double {mustBeInteger,mustBePositive} = 1
end

global ar

y = ar.model(iModel).data(iData).yFineSimu;
t = ar.model(iModel).data(iData).tFine;
yname = ar.model(iModel).data(iData).y;

ar.config.fiterrors = 1;  % ignore errors of biomodel data file

for i = 1:size(y,2)
    
    dat.tExp = t(:,1);
    if i>1 && size(t,2)>1
        dat.tExp = t(:,i);
    end
    dat.yExp = y(:,i);
    dat.ystd = nan(size(dat.yExp));
    
    res = arFitTransientFunction2(dat, fullfile(pwd, 'RealisticDesign', sprintf('TransientFit_M%d_D%d_%s', iModel, iData, yname{i})));

    %arPlotY;
    if i==1
        % create table for storing transient parameters
        transPars = table('Size', [size(y,2) length(ar.p)], ...
                          'VariableTypes', repmat("double",1,length(ar.p)), ...
                          'VariableNames', ar.pLabel);
    end
    transPars{i,:} = res.pRescaled;
end
% system('ps2pdf RealisticDesign/TransientFit.ps');
% delete 'RealisticDesign/TransientFit.ps'
% taus = transPars(:,contains(transPars.Properties.VariableNames,'time') | contains(transPars.Properties.VariableNames,'toffset'));

writetable([array2table(yname'), transPars], sprintf('RealisticDesign/transPars_M%d_D%d.txt', iModel, iData));
fprintf('Time parameters assessed by fitting transient function.\n');