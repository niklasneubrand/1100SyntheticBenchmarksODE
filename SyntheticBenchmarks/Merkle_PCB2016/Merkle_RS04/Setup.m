% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS04 
% Random seed:		0002204000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS04'); 

% Load the time-course data 
arLoadData('Merkle_RS04_TC001', 1); 
arLoadData('Merkle_RS04_TC002', 1); 
arLoadData('Merkle_RS04_TC003', 1); 
arLoadData('Merkle_RS04_TC004', 1); 
arLoadData('Merkle_RS04_TC005', 1); 
arLoadData('Merkle_RS04_TC006', 1); 
arLoadData('Merkle_RS04_TC007', 1); 
arLoadData('Merkle_RS04_TC008', 1); 
arLoadData('Merkle_RS04_TC009', 1); 
arLoadData('Merkle_RS04_TC010', 1); 
arLoadData('Merkle_RS04_TC011', 1); 
arLoadData('Merkle_RS04_TC012', 1); 
arLoadData('Merkle_RS04_TC013', 1); 
arLoadData('Merkle_RS04_TC014', 1); 
arLoadData('Merkle_RS04_TC015', 1); 
arLoadData('Merkle_RS04_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS04_DR001', 1); 
arLoadData('Merkle_RS04_DR002', 1); 
arLoadData('Merkle_RS04_DR003', 1); 
arLoadData('Merkle_RS04_DR004', 1); 
arLoadData('Merkle_RS04_DR005', 1); 
arLoadData('Merkle_RS04_DR006', 1); 
arLoadData('Merkle_RS04_DR007', 1); 
arLoadData('Merkle_RS04_DR008', 1); 
arLoadData('Merkle_RS04_DR009', 1); 
arLoadData('Merkle_RS04_DR010', 1); 
arLoadData('Merkle_RS04_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS04__Final', false, true); 

