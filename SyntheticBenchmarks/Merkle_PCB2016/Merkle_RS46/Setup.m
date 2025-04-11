% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS46 
% Random seed:		0002246000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS46'); 

% Load the time-course data 
arLoadData('Merkle_RS46_TC001', 1); 
arLoadData('Merkle_RS46_TC002', 1); 
arLoadData('Merkle_RS46_TC003', 1); 
arLoadData('Merkle_RS46_TC004', 1); 
arLoadData('Merkle_RS46_TC005', 1); 
arLoadData('Merkle_RS46_TC006', 1); 
arLoadData('Merkle_RS46_TC007', 1); 
arLoadData('Merkle_RS46_TC008', 1); 
arLoadData('Merkle_RS46_TC009', 1); 
arLoadData('Merkle_RS46_TC010', 1); 
arLoadData('Merkle_RS46_TC011', 1); 
arLoadData('Merkle_RS46_TC012', 1); 
arLoadData('Merkle_RS46_TC013', 1); 
arLoadData('Merkle_RS46_TC014', 1); 
arLoadData('Merkle_RS46_TC015', 1); 
arLoadData('Merkle_RS46_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS46_DR001', 1); 
arLoadData('Merkle_RS46_DR002', 1); 
arLoadData('Merkle_RS46_DR003', 1); 
arLoadData('Merkle_RS46_DR004', 1); 
arLoadData('Merkle_RS46_DR005', 1); 
arLoadData('Merkle_RS46_DR006', 1); 
arLoadData('Merkle_RS46_DR007', 1); 
arLoadData('Merkle_RS46_DR008', 1); 
arLoadData('Merkle_RS46_DR009', 1); 
arLoadData('Merkle_RS46_DR010', 1); 
arLoadData('Merkle_RS46_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS46__Final', false, true); 

