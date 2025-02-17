% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS07 
% Random seed:		0002207000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS07'); 

% Load the time-course data 
arLoadData('Merkle_RS07_TC001', 1); 
arLoadData('Merkle_RS07_TC002', 1); 
arLoadData('Merkle_RS07_TC003', 1); 
arLoadData('Merkle_RS07_TC004', 1); 
arLoadData('Merkle_RS07_TC005', 1); 
arLoadData('Merkle_RS07_TC006', 1); 
arLoadData('Merkle_RS07_TC007', 1); 
arLoadData('Merkle_RS07_TC008', 1); 
arLoadData('Merkle_RS07_TC009', 1); 
arLoadData('Merkle_RS07_TC010', 1); 
arLoadData('Merkle_RS07_TC011', 1); 
arLoadData('Merkle_RS07_TC012', 1); 
arLoadData('Merkle_RS07_TC013', 1); 
arLoadData('Merkle_RS07_TC014', 1); 
arLoadData('Merkle_RS07_TC015', 1); 
arLoadData('Merkle_RS07_TC016', 1); 
arLoadData('Merkle_RS07_TC017', 1); 
arLoadData('Merkle_RS07_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS07_DR001', 1); 
arLoadData('Merkle_RS07_DR002', 1); 
arLoadData('Merkle_RS07_DR003', 1); 
arLoadData('Merkle_RS07_DR004', 1); 
arLoadData('Merkle_RS07_DR005', 1); 
arLoadData('Merkle_RS07_DR006', 1); 
arLoadData('Merkle_RS07_DR007', 1); 
arLoadData('Merkle_RS07_DR008', 1); 
arLoadData('Merkle_RS07_DR009', 1); 
arLoadData('Merkle_RS07_DR010', 1); 
arLoadData('Merkle_RS07_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS07__Final', false, true); 

