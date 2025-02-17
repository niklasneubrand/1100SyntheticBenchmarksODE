% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS13 
% Random seed:		0002213000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS13'); 

% Load the time-course data 
arLoadData('Merkle_RS13_TC001', 1); 
arLoadData('Merkle_RS13_TC002', 1); 
arLoadData('Merkle_RS13_TC003', 1); 
arLoadData('Merkle_RS13_TC004', 1); 
arLoadData('Merkle_RS13_TC005', 1); 
arLoadData('Merkle_RS13_TC006', 1); 
arLoadData('Merkle_RS13_TC007', 1); 
arLoadData('Merkle_RS13_TC008', 1); 
arLoadData('Merkle_RS13_TC009', 1); 
arLoadData('Merkle_RS13_TC010', 1); 
arLoadData('Merkle_RS13_TC011', 1); 
arLoadData('Merkle_RS13_TC012', 1); 
arLoadData('Merkle_RS13_TC013', 1); 
arLoadData('Merkle_RS13_TC014', 1); 
arLoadData('Merkle_RS13_TC015', 1); 
arLoadData('Merkle_RS13_TC016', 1); 
arLoadData('Merkle_RS13_TC017', 1); 
arLoadData('Merkle_RS13_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS13_DR001', 1); 
arLoadData('Merkle_RS13_DR002', 1); 
arLoadData('Merkle_RS13_DR003', 1); 
arLoadData('Merkle_RS13_DR004', 1); 
arLoadData('Merkle_RS13_DR005', 1); 
arLoadData('Merkle_RS13_DR006', 1); 
arLoadData('Merkle_RS13_DR007', 1); 
arLoadData('Merkle_RS13_DR008', 1); 
arLoadData('Merkle_RS13_DR009', 1); 
arLoadData('Merkle_RS13_DR010', 1); 
arLoadData('Merkle_RS13_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS13__Final', false, true); 

