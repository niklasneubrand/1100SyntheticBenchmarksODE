% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS02 
% Random seed:		0002202000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS02'); 

% Load the time-course data 
arLoadData('Merkle_RS02_TC001', 1); 
arLoadData('Merkle_RS02_TC002', 1); 
arLoadData('Merkle_RS02_TC003', 1); 
arLoadData('Merkle_RS02_TC004', 1); 
arLoadData('Merkle_RS02_TC005', 1); 
arLoadData('Merkle_RS02_TC006', 1); 
arLoadData('Merkle_RS02_TC007', 1); 
arLoadData('Merkle_RS02_TC008', 1); 
arLoadData('Merkle_RS02_TC009', 1); 
arLoadData('Merkle_RS02_TC010', 1); 
arLoadData('Merkle_RS02_TC011', 1); 
arLoadData('Merkle_RS02_TC012', 1); 
arLoadData('Merkle_RS02_TC013', 1); 
arLoadData('Merkle_RS02_TC014', 1); 
arLoadData('Merkle_RS02_TC015', 1); 
arLoadData('Merkle_RS02_TC016', 1); 
arLoadData('Merkle_RS02_TC017', 1); 
arLoadData('Merkle_RS02_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS02_DR001', 1); 
arLoadData('Merkle_RS02_DR002', 1); 
arLoadData('Merkle_RS02_DR003', 1); 
arLoadData('Merkle_RS02_DR004', 1); 
arLoadData('Merkle_RS02_DR005', 1); 
arLoadData('Merkle_RS02_DR006', 1); 
arLoadData('Merkle_RS02_DR007', 1); 
arLoadData('Merkle_RS02_DR008', 1); 
arLoadData('Merkle_RS02_DR009', 1); 
arLoadData('Merkle_RS02_DR010', 1); 
arLoadData('Merkle_RS02_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS02__Final', false, true); 

