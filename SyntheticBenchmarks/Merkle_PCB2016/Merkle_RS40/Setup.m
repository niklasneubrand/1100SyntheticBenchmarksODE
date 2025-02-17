% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS40 
% Random seed:		0002240000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS40'); 

% Load the time-course data 
arLoadData('Merkle_RS40_TC001', 1); 
arLoadData('Merkle_RS40_TC002', 1); 
arLoadData('Merkle_RS40_TC003', 1); 
arLoadData('Merkle_RS40_TC004', 1); 
arLoadData('Merkle_RS40_TC005', 1); 
arLoadData('Merkle_RS40_TC006', 1); 
arLoadData('Merkle_RS40_TC007', 1); 
arLoadData('Merkle_RS40_TC008', 1); 
arLoadData('Merkle_RS40_TC009', 1); 
arLoadData('Merkle_RS40_TC010', 1); 
arLoadData('Merkle_RS40_TC011', 1); 
arLoadData('Merkle_RS40_TC012', 1); 
arLoadData('Merkle_RS40_TC013', 1); 
arLoadData('Merkle_RS40_TC014', 1); 
arLoadData('Merkle_RS40_TC015', 1); 
arLoadData('Merkle_RS40_TC016', 1); 
arLoadData('Merkle_RS40_TC017', 1); 
arLoadData('Merkle_RS40_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS40_DR001', 1); 
arLoadData('Merkle_RS40_DR002', 1); 
arLoadData('Merkle_RS40_DR003', 1); 
arLoadData('Merkle_RS40_DR004', 1); 
arLoadData('Merkle_RS40_DR005', 1); 
arLoadData('Merkle_RS40_DR006', 1); 
arLoadData('Merkle_RS40_DR007', 1); 
arLoadData('Merkle_RS40_DR008', 1); 
arLoadData('Merkle_RS40_DR009', 1); 
arLoadData('Merkle_RS40_DR010', 1); 
arLoadData('Merkle_RS40_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS40__Final', false, true); 

