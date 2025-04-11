% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS28 
% Random seed:		0002228000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS28'); 

% Load the time-course data 
arLoadData('Merkle_RS28_TC001', 1); 
arLoadData('Merkle_RS28_TC002', 1); 
arLoadData('Merkle_RS28_TC003', 1); 
arLoadData('Merkle_RS28_TC004', 1); 
arLoadData('Merkle_RS28_TC005', 1); 
arLoadData('Merkle_RS28_TC006', 1); 
arLoadData('Merkle_RS28_TC007', 1); 
arLoadData('Merkle_RS28_TC008', 1); 
arLoadData('Merkle_RS28_TC009', 1); 
arLoadData('Merkle_RS28_TC010', 1); 
arLoadData('Merkle_RS28_TC011', 1); 
arLoadData('Merkle_RS28_TC012', 1); 
arLoadData('Merkle_RS28_TC013', 1); 
arLoadData('Merkle_RS28_TC014', 1); 
arLoadData('Merkle_RS28_TC015', 1); 
arLoadData('Merkle_RS28_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS28_DR001', 1); 
arLoadData('Merkle_RS28_DR002', 1); 
arLoadData('Merkle_RS28_DR003', 1); 
arLoadData('Merkle_RS28_DR004', 1); 
arLoadData('Merkle_RS28_DR005', 1); 
arLoadData('Merkle_RS28_DR006', 1); 
arLoadData('Merkle_RS28_DR007', 1); 
arLoadData('Merkle_RS28_DR008', 1); 
arLoadData('Merkle_RS28_DR009', 1); 
arLoadData('Merkle_RS28_DR010', 1); 
arLoadData('Merkle_RS28_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS28__Final', false, true); 

