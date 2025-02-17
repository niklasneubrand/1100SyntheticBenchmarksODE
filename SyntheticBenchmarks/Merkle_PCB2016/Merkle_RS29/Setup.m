% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS29 
% Random seed:		0002229000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS29'); 

% Load the time-course data 
arLoadData('Merkle_RS29_TC001', 1); 
arLoadData('Merkle_RS29_TC002', 1); 
arLoadData('Merkle_RS29_TC003', 1); 
arLoadData('Merkle_RS29_TC004', 1); 
arLoadData('Merkle_RS29_TC005', 1); 
arLoadData('Merkle_RS29_TC006', 1); 
arLoadData('Merkle_RS29_TC007', 1); 
arLoadData('Merkle_RS29_TC008', 1); 
arLoadData('Merkle_RS29_TC009', 1); 
arLoadData('Merkle_RS29_TC010', 1); 
arLoadData('Merkle_RS29_TC011', 1); 
arLoadData('Merkle_RS29_TC012', 1); 
arLoadData('Merkle_RS29_TC013', 1); 
arLoadData('Merkle_RS29_TC014', 1); 
arLoadData('Merkle_RS29_TC015', 1); 
arLoadData('Merkle_RS29_TC016', 1); 
arLoadData('Merkle_RS29_TC017', 1); 
arLoadData('Merkle_RS29_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS29_DR001', 1); 
arLoadData('Merkle_RS29_DR002', 1); 
arLoadData('Merkle_RS29_DR003', 1); 
arLoadData('Merkle_RS29_DR004', 1); 
arLoadData('Merkle_RS29_DR005', 1); 
arLoadData('Merkle_RS29_DR006', 1); 
arLoadData('Merkle_RS29_DR007', 1); 
arLoadData('Merkle_RS29_DR008', 1); 
arLoadData('Merkle_RS29_DR009', 1); 
arLoadData('Merkle_RS29_DR010', 1); 
arLoadData('Merkle_RS29_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS29__Final', false, true); 

