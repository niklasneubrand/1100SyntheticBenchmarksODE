% Load models & data

arInit;

% ODE model
arLoadModel('epo_int_rep');
arLoadData('Epo_alpha_BaF3_Exp1_cpm_rep','epo_int_rep');

% Michaelis-Menten model
% deactivated for the realistic simulations
% arLoadModel('epo_binding');
% arLoadData('Epo_binding_rep','epo_binding');

arCompileAll;

% parameter with prior information
% in older verions it was std=0.02 which was overwritten by arLoadPars by std=0.5
arSetPars('init_Epo', log10(2100), 1, 1, -5, 4, 1, log10(2100), 0.5);

% load best parameters from a joint fit of ODE and Michaelis-Menten model
arLoadPars('BestFit');

% arPlot;
% arPrint;