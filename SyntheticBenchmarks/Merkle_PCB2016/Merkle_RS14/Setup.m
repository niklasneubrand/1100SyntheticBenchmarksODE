% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS14 
% Random seed:		0002214000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS14'); 

% Load the time-course data 
arLoadData('Merkle_RS14_TC001', 1); 
arLoadData('Merkle_RS14_TC002', 1); 
arLoadData('Merkle_RS14_TC003', 1); 
arLoadData('Merkle_RS14_TC004', 1); 
arLoadData('Merkle_RS14_TC005', 1); 
arLoadData('Merkle_RS14_TC006', 1); 
arLoadData('Merkle_RS14_TC007', 1); 
arLoadData('Merkle_RS14_TC008', 1); 
arLoadData('Merkle_RS14_TC009', 1); 
arLoadData('Merkle_RS14_TC010', 1); 
arLoadData('Merkle_RS14_TC011', 1); 
arLoadData('Merkle_RS14_TC012', 1); 
arLoadData('Merkle_RS14_TC013', 1); 
arLoadData('Merkle_RS14_TC014', 1); 
arLoadData('Merkle_RS14_TC015', 1); 
arLoadData('Merkle_RS14_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS14_DR001', 1); 
arLoadData('Merkle_RS14_DR002', 1); 
arLoadData('Merkle_RS14_DR003', 1); 
arLoadData('Merkle_RS14_DR004', 1); 
arLoadData('Merkle_RS14_DR005', 1); 
arLoadData('Merkle_RS14_DR006', 1); 
arLoadData('Merkle_RS14_DR007', 1); 
arLoadData('Merkle_RS14_DR008', 1); 
arLoadData('Merkle_RS14_DR009', 1); 
arLoadData('Merkle_RS14_DR010', 1); 
arLoadData('Merkle_RS14_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS14__Final', false, true); 

