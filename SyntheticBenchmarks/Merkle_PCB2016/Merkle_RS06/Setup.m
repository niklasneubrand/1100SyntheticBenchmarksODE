% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS06 
% Random seed:		0002206000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS06'); 

% Load the time-course data 
arLoadData('Merkle_RS06_TC001', 1); 
arLoadData('Merkle_RS06_TC002', 1); 
arLoadData('Merkle_RS06_TC003', 1); 
arLoadData('Merkle_RS06_TC004', 1); 
arLoadData('Merkle_RS06_TC005', 1); 
arLoadData('Merkle_RS06_TC006', 1); 
arLoadData('Merkle_RS06_TC007', 1); 
arLoadData('Merkle_RS06_TC008', 1); 
arLoadData('Merkle_RS06_TC009', 1); 
arLoadData('Merkle_RS06_TC010', 1); 
arLoadData('Merkle_RS06_TC011', 1); 
arLoadData('Merkle_RS06_TC012', 1); 
arLoadData('Merkle_RS06_TC013', 1); 
arLoadData('Merkle_RS06_TC014', 1); 
arLoadData('Merkle_RS06_TC015', 1); 
arLoadData('Merkle_RS06_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS06_DR001', 1); 
arLoadData('Merkle_RS06_DR002', 1); 
arLoadData('Merkle_RS06_DR003', 1); 
arLoadData('Merkle_RS06_DR004', 1); 
arLoadData('Merkle_RS06_DR005', 1); 
arLoadData('Merkle_RS06_DR006', 1); 
arLoadData('Merkle_RS06_DR007', 1); 
arLoadData('Merkle_RS06_DR008', 1); 
arLoadData('Merkle_RS06_DR009', 1); 
arLoadData('Merkle_RS06_DR010', 1); 
arLoadData('Merkle_RS06_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS06__Final', false, true); 

