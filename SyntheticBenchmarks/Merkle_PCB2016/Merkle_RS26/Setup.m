% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS26 
% Random seed:		0002226000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS26'); 

% Load the time-course data 
arLoadData('Merkle_RS26_TC001', 1); 
arLoadData('Merkle_RS26_TC002', 1); 
arLoadData('Merkle_RS26_TC003', 1); 
arLoadData('Merkle_RS26_TC004', 1); 
arLoadData('Merkle_RS26_TC005', 1); 
arLoadData('Merkle_RS26_TC006', 1); 
arLoadData('Merkle_RS26_TC007', 1); 
arLoadData('Merkle_RS26_TC008', 1); 
arLoadData('Merkle_RS26_TC009', 1); 
arLoadData('Merkle_RS26_TC010', 1); 
arLoadData('Merkle_RS26_TC011', 1); 
arLoadData('Merkle_RS26_TC012', 1); 
arLoadData('Merkle_RS26_TC013', 1); 
arLoadData('Merkle_RS26_TC014', 1); 
arLoadData('Merkle_RS26_TC015', 1); 
arLoadData('Merkle_RS26_TC016', 1); 
arLoadData('Merkle_RS26_TC017', 1); 
arLoadData('Merkle_RS26_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS26_DR001', 1); 
arLoadData('Merkle_RS26_DR002', 1); 
arLoadData('Merkle_RS26_DR003', 1); 
arLoadData('Merkle_RS26_DR004', 1); 
arLoadData('Merkle_RS26_DR005', 1); 
arLoadData('Merkle_RS26_DR006', 1); 
arLoadData('Merkle_RS26_DR007', 1); 
arLoadData('Merkle_RS26_DR008', 1); 
arLoadData('Merkle_RS26_DR009', 1); 
arLoadData('Merkle_RS26_DR010', 1); 
arLoadData('Merkle_RS26_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS26__Final', false, true); 

