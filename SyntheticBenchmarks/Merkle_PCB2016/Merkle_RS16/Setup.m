% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS16 
% Random seed:		0002216000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS16'); 

% Load the time-course data 
arLoadData('Merkle_RS16_TC001', 1); 
arLoadData('Merkle_RS16_TC002', 1); 
arLoadData('Merkle_RS16_TC003', 1); 
arLoadData('Merkle_RS16_TC004', 1); 
arLoadData('Merkle_RS16_TC005', 1); 
arLoadData('Merkle_RS16_TC006', 1); 
arLoadData('Merkle_RS16_TC007', 1); 
arLoadData('Merkle_RS16_TC008', 1); 
arLoadData('Merkle_RS16_TC009', 1); 
arLoadData('Merkle_RS16_TC010', 1); 
arLoadData('Merkle_RS16_TC011', 1); 
arLoadData('Merkle_RS16_TC012', 1); 
arLoadData('Merkle_RS16_TC013', 1); 
arLoadData('Merkle_RS16_TC014', 1); 
arLoadData('Merkle_RS16_TC015', 1); 
arLoadData('Merkle_RS16_TC016', 1); 
arLoadData('Merkle_RS16_TC017', 1); 
arLoadData('Merkle_RS16_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS16_DR001', 1); 
arLoadData('Merkle_RS16_DR002', 1); 
arLoadData('Merkle_RS16_DR003', 1); 
arLoadData('Merkle_RS16_DR004', 1); 
arLoadData('Merkle_RS16_DR005', 1); 
arLoadData('Merkle_RS16_DR006', 1); 
arLoadData('Merkle_RS16_DR007', 1); 
arLoadData('Merkle_RS16_DR008', 1); 
arLoadData('Merkle_RS16_DR009', 1); 
arLoadData('Merkle_RS16_DR010', 1); 
arLoadData('Merkle_RS16_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS16__Final', false, true); 

