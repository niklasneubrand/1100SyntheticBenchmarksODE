% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS23 
% Random seed:		0002223000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS23'); 

% Load the time-course data 
arLoadData('Merkle_RS23_TC001', 1); 
arLoadData('Merkle_RS23_TC002', 1); 
arLoadData('Merkle_RS23_TC003', 1); 
arLoadData('Merkle_RS23_TC004', 1); 
arLoadData('Merkle_RS23_TC005', 1); 
arLoadData('Merkle_RS23_TC006', 1); 
arLoadData('Merkle_RS23_TC007', 1); 
arLoadData('Merkle_RS23_TC008', 1); 
arLoadData('Merkle_RS23_TC009', 1); 
arLoadData('Merkle_RS23_TC010', 1); 
arLoadData('Merkle_RS23_TC011', 1); 
arLoadData('Merkle_RS23_TC012', 1); 
arLoadData('Merkle_RS23_TC013', 1); 
arLoadData('Merkle_RS23_TC014', 1); 
arLoadData('Merkle_RS23_TC015', 1); 
arLoadData('Merkle_RS23_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS23_DR001', 1); 
arLoadData('Merkle_RS23_DR002', 1); 
arLoadData('Merkle_RS23_DR003', 1); 
arLoadData('Merkle_RS23_DR004', 1); 
arLoadData('Merkle_RS23_DR005', 1); 
arLoadData('Merkle_RS23_DR006', 1); 
arLoadData('Merkle_RS23_DR007', 1); 
arLoadData('Merkle_RS23_DR008', 1); 
arLoadData('Merkle_RS23_DR009', 1); 
arLoadData('Merkle_RS23_DR010', 1); 
arLoadData('Merkle_RS23_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS23__Final', false, true); 

