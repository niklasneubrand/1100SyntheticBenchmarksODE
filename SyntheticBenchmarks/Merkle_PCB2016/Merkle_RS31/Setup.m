% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS31 
% Random seed:		0002231000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS31'); 

% Load the time-course data 
arLoadData('Merkle_RS31_TC001', 1); 
arLoadData('Merkle_RS31_TC002', 1); 
arLoadData('Merkle_RS31_TC003', 1); 
arLoadData('Merkle_RS31_TC004', 1); 
arLoadData('Merkle_RS31_TC005', 1); 
arLoadData('Merkle_RS31_TC006', 1); 
arLoadData('Merkle_RS31_TC007', 1); 
arLoadData('Merkle_RS31_TC008', 1); 
arLoadData('Merkle_RS31_TC009', 1); 
arLoadData('Merkle_RS31_TC010', 1); 
arLoadData('Merkle_RS31_TC011', 1); 
arLoadData('Merkle_RS31_TC012', 1); 
arLoadData('Merkle_RS31_TC013', 1); 
arLoadData('Merkle_RS31_TC014', 1); 
arLoadData('Merkle_RS31_TC015', 1); 
arLoadData('Merkle_RS31_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS31_DR001', 1); 
arLoadData('Merkle_RS31_DR002', 1); 
arLoadData('Merkle_RS31_DR003', 1); 
arLoadData('Merkle_RS31_DR004', 1); 
arLoadData('Merkle_RS31_DR005', 1); 
arLoadData('Merkle_RS31_DR006', 1); 
arLoadData('Merkle_RS31_DR007', 1); 
arLoadData('Merkle_RS31_DR008', 1); 
arLoadData('Merkle_RS31_DR009', 1); 
arLoadData('Merkle_RS31_DR010', 1); 
arLoadData('Merkle_RS31_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS31__Final', false, true); 

