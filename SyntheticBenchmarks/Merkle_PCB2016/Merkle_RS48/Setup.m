% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS48 
% Random seed:		0002248000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS48'); 

% Load the time-course data 
arLoadData('Merkle_RS48_TC001', 1); 
arLoadData('Merkle_RS48_TC002', 1); 
arLoadData('Merkle_RS48_TC003', 1); 
arLoadData('Merkle_RS48_TC004', 1); 
arLoadData('Merkle_RS48_TC005', 1); 
arLoadData('Merkle_RS48_TC006', 1); 
arLoadData('Merkle_RS48_TC007', 1); 
arLoadData('Merkle_RS48_TC008', 1); 
arLoadData('Merkle_RS48_TC009', 1); 
arLoadData('Merkle_RS48_TC010', 1); 
arLoadData('Merkle_RS48_TC011', 1); 
arLoadData('Merkle_RS48_TC012', 1); 
arLoadData('Merkle_RS48_TC013', 1); 
arLoadData('Merkle_RS48_TC014', 1); 
arLoadData('Merkle_RS48_TC015', 1); 
arLoadData('Merkle_RS48_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS48_DR001', 1); 
arLoadData('Merkle_RS48_DR002', 1); 
arLoadData('Merkle_RS48_DR003', 1); 
arLoadData('Merkle_RS48_DR004', 1); 
arLoadData('Merkle_RS48_DR005', 1); 
arLoadData('Merkle_RS48_DR006', 1); 
arLoadData('Merkle_RS48_DR007', 1); 
arLoadData('Merkle_RS48_DR008', 1); 
arLoadData('Merkle_RS48_DR009', 1); 
arLoadData('Merkle_RS48_DR010', 1); 
arLoadData('Merkle_RS48_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS48__Final', false, true); 

