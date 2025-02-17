% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS03 
% Random seed:		0002203000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS03'); 

% Load the time-course data 
arLoadData('Merkle_RS03_TC001', 1); 
arLoadData('Merkle_RS03_TC002', 1); 
arLoadData('Merkle_RS03_TC003', 1); 
arLoadData('Merkle_RS03_TC004', 1); 
arLoadData('Merkle_RS03_TC005', 1); 
arLoadData('Merkle_RS03_TC006', 1); 
arLoadData('Merkle_RS03_TC007', 1); 
arLoadData('Merkle_RS03_TC008', 1); 
arLoadData('Merkle_RS03_TC009', 1); 
arLoadData('Merkle_RS03_TC010', 1); 
arLoadData('Merkle_RS03_TC011', 1); 
arLoadData('Merkle_RS03_TC012', 1); 
arLoadData('Merkle_RS03_TC013', 1); 
arLoadData('Merkle_RS03_TC014', 1); 
arLoadData('Merkle_RS03_TC015', 1); 
arLoadData('Merkle_RS03_TC016', 1); 
arLoadData('Merkle_RS03_TC017', 1); 
arLoadData('Merkle_RS03_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS03_DR001', 1); 
arLoadData('Merkle_RS03_DR002', 1); 
arLoadData('Merkle_RS03_DR003', 1); 
arLoadData('Merkle_RS03_DR004', 1); 
arLoadData('Merkle_RS03_DR005', 1); 
arLoadData('Merkle_RS03_DR006', 1); 
arLoadData('Merkle_RS03_DR007', 1); 
arLoadData('Merkle_RS03_DR008', 1); 
arLoadData('Merkle_RS03_DR009', 1); 
arLoadData('Merkle_RS03_DR010', 1); 
arLoadData('Merkle_RS03_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS03__Final', false, true); 

