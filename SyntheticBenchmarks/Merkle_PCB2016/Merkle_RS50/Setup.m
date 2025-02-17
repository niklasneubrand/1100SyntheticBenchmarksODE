% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS50 
% Random seed:		0002250000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS50'); 

% Load the time-course data 
arLoadData('Merkle_RS50_TC001', 1); 
arLoadData('Merkle_RS50_TC002', 1); 
arLoadData('Merkle_RS50_TC003', 1); 
arLoadData('Merkle_RS50_TC004', 1); 
arLoadData('Merkle_RS50_TC005', 1); 
arLoadData('Merkle_RS50_TC006', 1); 
arLoadData('Merkle_RS50_TC007', 1); 
arLoadData('Merkle_RS50_TC008', 1); 
arLoadData('Merkle_RS50_TC009', 1); 
arLoadData('Merkle_RS50_TC010', 1); 
arLoadData('Merkle_RS50_TC011', 1); 
arLoadData('Merkle_RS50_TC012', 1); 
arLoadData('Merkle_RS50_TC013', 1); 
arLoadData('Merkle_RS50_TC014', 1); 
arLoadData('Merkle_RS50_TC015', 1); 
arLoadData('Merkle_RS50_TC016', 1); 
arLoadData('Merkle_RS50_TC017', 1); 
arLoadData('Merkle_RS50_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS50_DR001', 1); 
arLoadData('Merkle_RS50_DR002', 1); 
arLoadData('Merkle_RS50_DR003', 1); 
arLoadData('Merkle_RS50_DR004', 1); 
arLoadData('Merkle_RS50_DR005', 1); 
arLoadData('Merkle_RS50_DR006', 1); 
arLoadData('Merkle_RS50_DR007', 1); 
arLoadData('Merkle_RS50_DR008', 1); 
arLoadData('Merkle_RS50_DR009', 1); 
arLoadData('Merkle_RS50_DR010', 1); 
arLoadData('Merkle_RS50_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS50__Final', false, true); 

