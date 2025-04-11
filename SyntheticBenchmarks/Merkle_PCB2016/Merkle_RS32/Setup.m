% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS32 
% Random seed:		0002232000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS32'); 

% Load the time-course data 
arLoadData('Merkle_RS32_TC001', 1); 
arLoadData('Merkle_RS32_TC002', 1); 
arLoadData('Merkle_RS32_TC003', 1); 
arLoadData('Merkle_RS32_TC004', 1); 
arLoadData('Merkle_RS32_TC005', 1); 
arLoadData('Merkle_RS32_TC006', 1); 
arLoadData('Merkle_RS32_TC007', 1); 
arLoadData('Merkle_RS32_TC008', 1); 
arLoadData('Merkle_RS32_TC009', 1); 
arLoadData('Merkle_RS32_TC010', 1); 
arLoadData('Merkle_RS32_TC011', 1); 
arLoadData('Merkle_RS32_TC012', 1); 
arLoadData('Merkle_RS32_TC013', 1); 
arLoadData('Merkle_RS32_TC014', 1); 
arLoadData('Merkle_RS32_TC015', 1); 
arLoadData('Merkle_RS32_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS32_DR001', 1); 
arLoadData('Merkle_RS32_DR002', 1); 
arLoadData('Merkle_RS32_DR003', 1); 
arLoadData('Merkle_RS32_DR004', 1); 
arLoadData('Merkle_RS32_DR005', 1); 
arLoadData('Merkle_RS32_DR006', 1); 
arLoadData('Merkle_RS32_DR007', 1); 
arLoadData('Merkle_RS32_DR008', 1); 
arLoadData('Merkle_RS32_DR009', 1); 
arLoadData('Merkle_RS32_DR010', 1); 
arLoadData('Merkle_RS32_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS32__Final', false, true); 

