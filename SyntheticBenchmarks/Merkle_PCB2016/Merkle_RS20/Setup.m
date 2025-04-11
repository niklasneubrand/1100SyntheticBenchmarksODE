% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS20 
% Random seed:		0002220000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS20'); 

% Load the time-course data 
arLoadData('Merkle_RS20_TC001', 1); 
arLoadData('Merkle_RS20_TC002', 1); 
arLoadData('Merkle_RS20_TC003', 1); 
arLoadData('Merkle_RS20_TC004', 1); 
arLoadData('Merkle_RS20_TC005', 1); 
arLoadData('Merkle_RS20_TC006', 1); 
arLoadData('Merkle_RS20_TC007', 1); 
arLoadData('Merkle_RS20_TC008', 1); 
arLoadData('Merkle_RS20_TC009', 1); 
arLoadData('Merkle_RS20_TC010', 1); 
arLoadData('Merkle_RS20_TC011', 1); 
arLoadData('Merkle_RS20_TC012', 1); 
arLoadData('Merkle_RS20_TC013', 1); 
arLoadData('Merkle_RS20_TC014', 1); 
arLoadData('Merkle_RS20_TC015', 1); 
arLoadData('Merkle_RS20_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS20_DR001', 1); 
arLoadData('Merkle_RS20_DR002', 1); 
arLoadData('Merkle_RS20_DR003', 1); 
arLoadData('Merkle_RS20_DR004', 1); 
arLoadData('Merkle_RS20_DR005', 1); 
arLoadData('Merkle_RS20_DR006', 1); 
arLoadData('Merkle_RS20_DR007', 1); 
arLoadData('Merkle_RS20_DR008', 1); 
arLoadData('Merkle_RS20_DR009', 1); 
arLoadData('Merkle_RS20_DR010', 1); 
arLoadData('Merkle_RS20_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS20__Final', false, true); 

