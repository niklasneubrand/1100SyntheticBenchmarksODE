% Load models & data
%clear all, close all
arInit;

arLoadModel('model_Reelin_FINAL');

arLoadData('Reelin_norm', 1);
arLoadData('Reelin_wInh', 1);
arLoadData('Reelin_wInh_Reelin', 1);
arLoadData('Reelin_DR', 1);
arLoadData('Reelin_EC50', 1);

arCompileAll;
arFindInputs;
%Set wide bounds for scaling parameters
arSetPars(ar.pLabel(strncmp('scale',ar.pLabel,5)),ones(1,150)*1,ones(1,150),ones(1,150),ones(1,150)*(-5),ones(1,150)*5);
%Non log bounds for inhibition ratio [0,1]
arSetPars('SFK_inhibition_ratio',-1,1,1,-10,0)

%Structural non-identifiabilities and model reductions
arSetPars({'ApoER2_Dab1_act','init_ApoER2_Dab1'},[6 0],[2 2],ones(1,2),[-2 -2],[7 3]);

%Use standard deviations from data sheet
ar.config.fiterrors = -1;
ar.config.ploterrors = 1;
ar.config.maxsteps = 1e5;   % original 1e4

% the order of magnitude for states X varies largely
% this causes problems for solving the states with small values
% -> use vector tolerances
ar.config.atolV = true;
ar.config.atolV_Sens = true;

arSetParsPattern('sd_',-1,0,1,-5,3)
arLoadPars('BestFit')

%Fix observational parameters without corresponding data
arSetPars({'offset_tApo_ExpEC50R','offset_tApo_ExpReelin_DR','offset_tApo_ExpReelin_Inh','offset_tApo_ExponlyInh','offset_tSFK_ExpEC50R','offset_tSFK_ExpReelin_DR','offset_tSFK_ExpReelin_Inh','offset_tSFK_ExponlyInh','scale_tApo__ExpEC50R','scale_tApo__ExpReelin_DR','scale_tApo__ExpReelin_Inh','scale_tApo__ExponlyInh','scale_tSFK_ExpEC50R','scale_tSFK_ExpReelin_DR','scale_tSFK_ExpReelin_Inh','scale_tSFK_ExponlyInh',},zeros(1,16),ones(1,16)*2,zeros(1,16),ones(1,16)*-5,ones(1,16)*3)
arSetPars('offset_tSFK_ExpReelinStim',[],2,1,-3,3)

%No log plotting
ar.model(1).qPlotYs(:) = 1;
for i = 1:length(ar.model(1).data)
    ar.model(1).data(i).logplotting(:) = 0;
end
