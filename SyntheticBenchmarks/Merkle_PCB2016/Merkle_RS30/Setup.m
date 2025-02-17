% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS30 
% Random seed:		0002230000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS30'); 

% Load the time-course data 
arLoadData('Merkle_RS30_TC001', 1); 
arLoadData('Merkle_RS30_TC002', 1); 
arLoadData('Merkle_RS30_TC003', 1); 
arLoadData('Merkle_RS30_TC004', 1); 
arLoadData('Merkle_RS30_TC005', 1); 
arLoadData('Merkle_RS30_TC006', 1); 
arLoadData('Merkle_RS30_TC007', 1); 
arLoadData('Merkle_RS30_TC008', 1); 
arLoadData('Merkle_RS30_TC009', 1); 
arLoadData('Merkle_RS30_TC010', 1); 
arLoadData('Merkle_RS30_TC011', 1); 
arLoadData('Merkle_RS30_TC012', 1); 
arLoadData('Merkle_RS30_TC013', 1); 
arLoadData('Merkle_RS30_TC014', 1); 
arLoadData('Merkle_RS30_TC015', 1); 
arLoadData('Merkle_RS30_TC016', 1); 
arLoadData('Merkle_RS30_TC017', 1); 
arLoadData('Merkle_RS30_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS30_DR001', 1); 
arLoadData('Merkle_RS30_DR002', 1); 
arLoadData('Merkle_RS30_DR003', 1); 
arLoadData('Merkle_RS30_DR004', 1); 
arLoadData('Merkle_RS30_DR005', 1); 
arLoadData('Merkle_RS30_DR006', 1); 
arLoadData('Merkle_RS30_DR007', 1); 
arLoadData('Merkle_RS30_DR008', 1); 
arLoadData('Merkle_RS30_DR009', 1); 
arLoadData('Merkle_RS30_DR010', 1); 
arLoadData('Merkle_RS30_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS30__Final', false, true); 

