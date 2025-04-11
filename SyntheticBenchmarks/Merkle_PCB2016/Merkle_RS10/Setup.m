% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS10 
% Random seed:		0002210000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS10'); 

% Load the time-course data 
arLoadData('Merkle_RS10_TC001', 1); 
arLoadData('Merkle_RS10_TC002', 1); 
arLoadData('Merkle_RS10_TC003', 1); 
arLoadData('Merkle_RS10_TC004', 1); 
arLoadData('Merkle_RS10_TC005', 1); 
arLoadData('Merkle_RS10_TC006', 1); 
arLoadData('Merkle_RS10_TC007', 1); 
arLoadData('Merkle_RS10_TC008', 1); 
arLoadData('Merkle_RS10_TC009', 1); 
arLoadData('Merkle_RS10_TC010', 1); 
arLoadData('Merkle_RS10_TC011', 1); 
arLoadData('Merkle_RS10_TC012', 1); 
arLoadData('Merkle_RS10_TC013', 1); 
arLoadData('Merkle_RS10_TC014', 1); 
arLoadData('Merkle_RS10_TC015', 1); 
arLoadData('Merkle_RS10_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS10_DR001', 1); 
arLoadData('Merkle_RS10_DR002', 1); 
arLoadData('Merkle_RS10_DR003', 1); 
arLoadData('Merkle_RS10_DR004', 1); 
arLoadData('Merkle_RS10_DR005', 1); 
arLoadData('Merkle_RS10_DR006', 1); 
arLoadData('Merkle_RS10_DR007', 1); 
arLoadData('Merkle_RS10_DR008', 1); 
arLoadData('Merkle_RS10_DR009', 1); 
arLoadData('Merkle_RS10_DR010', 1); 
arLoadData('Merkle_RS10_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS10__Final', false, true); 

