% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS45 
% Random seed:		0002245000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS45'); 

% Load the time-course data 
arLoadData('Merkle_RS45_TC001', 1); 
arLoadData('Merkle_RS45_TC002', 1); 
arLoadData('Merkle_RS45_TC003', 1); 
arLoadData('Merkle_RS45_TC004', 1); 
arLoadData('Merkle_RS45_TC005', 1); 
arLoadData('Merkle_RS45_TC006', 1); 
arLoadData('Merkle_RS45_TC007', 1); 
arLoadData('Merkle_RS45_TC008', 1); 
arLoadData('Merkle_RS45_TC009', 1); 
arLoadData('Merkle_RS45_TC010', 1); 
arLoadData('Merkle_RS45_TC011', 1); 
arLoadData('Merkle_RS45_TC012', 1); 
arLoadData('Merkle_RS45_TC013', 1); 
arLoadData('Merkle_RS45_TC014', 1); 
arLoadData('Merkle_RS45_TC015', 1); 
arLoadData('Merkle_RS45_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS45_DR001', 1); 
arLoadData('Merkle_RS45_DR002', 1); 
arLoadData('Merkle_RS45_DR003', 1); 
arLoadData('Merkle_RS45_DR004', 1); 
arLoadData('Merkle_RS45_DR005', 1); 
arLoadData('Merkle_RS45_DR006', 1); 
arLoadData('Merkle_RS45_DR007', 1); 
arLoadData('Merkle_RS45_DR008', 1); 
arLoadData('Merkle_RS45_DR009', 1); 
arLoadData('Merkle_RS45_DR010', 1); 
arLoadData('Merkle_RS45_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS45__Final', false, true); 

