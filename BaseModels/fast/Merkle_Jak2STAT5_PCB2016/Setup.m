% Load model & data
arInit;

arLoadModel('jak2_stat5_parent');

% CFU-E
arLoadData('CFUE/Long');
arLoadData('CFUE/Concentrations');
arLoadData('CFUE/RNA');
arLoadData('CFUE/ActD');
arLoadData('CFUE/Fine');
arLoadData('CFUE/SOCS3oe');
arLoadData('CFUE/SHP1oe');
arLoadData('CFUE/DoseResp_7min');
arLoadData('CFUE/DoseResp_30min');
arLoadData('CFUE/DoseResp_pSTAT5_10min_fine');
arLoadData('CFUE/DoseResp_CIS_90min');
arLoadData('CFUE/RNA_ActD_noEpo');

% H838
arLoadData('H838_L1/IB_TC_pEpoR-pSTAT5');
arLoadData('H838_L1/IB_TC_pJAK2-pEpoR');
arLoadData('H838_L1/IB_TC_pJAK2-pSTAT5');
arLoadData('H838_L1/IB_TC_pSTAT5');
arLoadData('H838_L1/IB_TC_pJAK2-pEpoR-pSTAT5');
arLoadData('H838_L1/MS_TC_pSTAT5');
arLoadData('H838_L1/MS_DR_pSTAT5');
arLoadData('H838_L1/qRTPCR_TC_CISHRNA');

% H838-EpoR
arLoadData('H838EpoR_L1/IB_TC_pSTAT5-pEpoR');
arLoadData('H838EpoR_L1/IB_TC_pJAK2-pEpoR');
arLoadData('H838EpoR_L1/IB_TC_STAT5_1');
arLoadData('H838EpoR_L1/IB_TC_STAT5_2');
arLoadData('H838EpoR_L1/IB_DR_pJAK2-EpoR');
arLoadData('H838EpoR_L1/IB_TC_SOCS3');
arLoadData('H838EpoR_L1/IB_DR_SOCS3');
arLoadData('H838EpoR_L1/MS_DR_pSTAT5');
arLoadData('H838EpoR_L1/IB_DR_pJAK2-pEpoR-pSTAT5_1_epo');
arLoadData('H838EpoR_L1/IB_DR_pJAK2-pEpoR-pSTAT5_2_epo');
arLoadData('H838EpoR_L1/qRTPCR_TC_Cish-SOCS3');
arLoadData('H838EpoR_L1/qRTPCR_ActD_noEpo');

% Both H838 and H838-EpoR on one blot
arLoadData('H838-H838EpoR_L1_IB_DR_pJAK2-pEpoR');

% Validation
% arLoadData('CFUE/RNA_validation');
% arLoadData('H838EpoR_L1/qRTPCR_TC_Cish-SOCS3_long');

arCompileAll;
arFindInputs;
%ar.config.optim.Display = 'iter';
ar.model.qPlotYs(:) = 1;

arLoadPars('reducedfinal');

% Not fit validation data
% for id = [ar.model.plot(end-1).dLink ar.model.plot(end).dLink]
%     ar.model.data(id).qFit(:) = 0;
% end
