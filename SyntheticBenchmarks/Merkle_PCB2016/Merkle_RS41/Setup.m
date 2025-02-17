% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS41 
% Random seed:		0002241000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS41'); 

% Load the time-course data 
arLoadData('Merkle_RS41_TC001', 1); 
arLoadData('Merkle_RS41_TC002', 1); 
arLoadData('Merkle_RS41_TC003', 1); 
arLoadData('Merkle_RS41_TC004', 1); 
arLoadData('Merkle_RS41_TC005', 1); 
arLoadData('Merkle_RS41_TC006', 1); 
arLoadData('Merkle_RS41_TC007', 1); 
arLoadData('Merkle_RS41_TC008', 1); 
arLoadData('Merkle_RS41_TC009', 1); 
arLoadData('Merkle_RS41_TC010', 1); 
arLoadData('Merkle_RS41_TC011', 1); 
arLoadData('Merkle_RS41_TC012', 1); 
arLoadData('Merkle_RS41_TC013', 1); 
arLoadData('Merkle_RS41_TC014', 1); 
arLoadData('Merkle_RS41_TC015', 1); 
arLoadData('Merkle_RS41_TC016', 1); 
arLoadData('Merkle_RS41_TC017', 1); 
arLoadData('Merkle_RS41_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS41_DR001', 1); 
arLoadData('Merkle_RS41_DR002', 1); 
arLoadData('Merkle_RS41_DR003', 1); 
arLoadData('Merkle_RS41_DR004', 1); 
arLoadData('Merkle_RS41_DR005', 1); 
arLoadData('Merkle_RS41_DR006', 1); 
arLoadData('Merkle_RS41_DR007', 1); 
arLoadData('Merkle_RS41_DR008', 1); 
arLoadData('Merkle_RS41_DR009', 1); 
arLoadData('Merkle_RS41_DR010', 1); 
arLoadData('Merkle_RS41_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS41__Final', false, true); 

