% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS47 
% Random seed:		0002247000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS47'); 

% Load the time-course data 
arLoadData('Merkle_RS47_TC001', 1); 
arLoadData('Merkle_RS47_TC002', 1); 
arLoadData('Merkle_RS47_TC003', 1); 
arLoadData('Merkle_RS47_TC004', 1); 
arLoadData('Merkle_RS47_TC005', 1); 
arLoadData('Merkle_RS47_TC006', 1); 
arLoadData('Merkle_RS47_TC007', 1); 
arLoadData('Merkle_RS47_TC008', 1); 
arLoadData('Merkle_RS47_TC009', 1); 
arLoadData('Merkle_RS47_TC010', 1); 
arLoadData('Merkle_RS47_TC011', 1); 
arLoadData('Merkle_RS47_TC012', 1); 
arLoadData('Merkle_RS47_TC013', 1); 
arLoadData('Merkle_RS47_TC014', 1); 
arLoadData('Merkle_RS47_TC015', 1); 
arLoadData('Merkle_RS47_TC016', 1); 
arLoadData('Merkle_RS47_TC017', 1); 
arLoadData('Merkle_RS47_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS47_DR001', 1); 
arLoadData('Merkle_RS47_DR002', 1); 
arLoadData('Merkle_RS47_DR003', 1); 
arLoadData('Merkle_RS47_DR004', 1); 
arLoadData('Merkle_RS47_DR005', 1); 
arLoadData('Merkle_RS47_DR006', 1); 
arLoadData('Merkle_RS47_DR007', 1); 
arLoadData('Merkle_RS47_DR008', 1); 
arLoadData('Merkle_RS47_DR009', 1); 
arLoadData('Merkle_RS47_DR010', 1); 
arLoadData('Merkle_RS47_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS47__Final', false, true); 

