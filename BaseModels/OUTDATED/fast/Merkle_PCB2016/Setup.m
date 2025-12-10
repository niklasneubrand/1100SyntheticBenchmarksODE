% Load model & data
arInit;

arLoadModel('jak2_stat5_parent');

% CFU-E
arLoadData('Long', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('Concentrations', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('RNA', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('ActD', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('Fine', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('SOCS3oe', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('SHP1oe', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('DoseResp_7min', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('DoseResp_30min', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('DoseResp_pSTAT5_10min_fine', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('DoseResp_CIS_90min', [], [], [], 'datapath', 'Data/CFUE');
arLoadData('RNA_ActD_noEpo', [], [], [], 'datapath', 'Data/CFUE');

% H838
arLoadData('IB_TC_pEpoR-pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('IB_TC_pJAK2-pEpoR', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('IB_TC_pJAK2-pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('IB_TC_pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('IB_TC_pJAK2-pEpoR-pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('MS_TC_pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('MS_DR_pSTAT5', [], [], [], 'datapath', 'Data/H838_L1');
arLoadData('qRTPCR_TC_CISHRNA', [], [], [], 'datapath', 'Data/H838_L1');

% H838-EpoR
arLoadData('IB_TC_pSTAT5-pEpoR', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_TC_pJAK2-pEpoR', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_TC_STAT5_1', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_TC_STAT5_2', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_DR_pJAK2-EpoR', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_TC_SOCS3', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_DR_SOCS3', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('MS_DR_pSTAT5', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_DR_pJAK2-pEpoR-pSTAT5_1_epo', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('IB_DR_pJAK2-pEpoR-pSTAT5_2_epo', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('qRTPCR_TC_Cish-SOCS3', [], [], [], 'datapath', 'Data/H838EpoR_L1');
arLoadData('qRTPCR_ActD_noEpo', [], [], [], 'datapath', 'Data/H838EpoR_L1');

% Both H838 and H838-EpoR on one blot
arLoadData('H838-H838EpoR_L1_IB_DR_pJAK2-pEpoR');

% Validation
% arLoadData('RNA_validation', [], [], [], 'datapath', 'Data/CFUE');
% arLoadData('qRTPCR_TC_Cish-SOCS3_long', [], [], [], 'datapath', 'Data/H838EpoR_L1');

arCompileAll;
arFindInputs;
%ar.config.optim.Display = 'iter';
ar.model.qPlotYs(:) = 1;

arLoadPars('reducedfinal');

% Not fit validation data
% for id = [ar.model.plot(end-1).dLink ar.model.plot(end).dLink]
%     ar.model.data(id).qFit(:) = 0;
% end
