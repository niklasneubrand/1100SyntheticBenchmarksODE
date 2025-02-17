% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS17 
% Random seed:		0002217000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS17'); 

% Load the time-course data 
arLoadData('Merkle_RS17_TC001', 1); 
arLoadData('Merkle_RS17_TC002', 1); 
arLoadData('Merkle_RS17_TC003', 1); 
arLoadData('Merkle_RS17_TC004', 1); 
arLoadData('Merkle_RS17_TC005', 1); 
arLoadData('Merkle_RS17_TC006', 1); 
arLoadData('Merkle_RS17_TC007', 1); 
arLoadData('Merkle_RS17_TC008', 1); 
arLoadData('Merkle_RS17_TC009', 1); 
arLoadData('Merkle_RS17_TC010', 1); 
arLoadData('Merkle_RS17_TC011', 1); 
arLoadData('Merkle_RS17_TC012', 1); 
arLoadData('Merkle_RS17_TC013', 1); 
arLoadData('Merkle_RS17_TC014', 1); 
arLoadData('Merkle_RS17_TC015', 1); 
arLoadData('Merkle_RS17_TC016', 1); 
arLoadData('Merkle_RS17_TC017', 1); 
arLoadData('Merkle_RS17_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS17_DR001', 1); 
arLoadData('Merkle_RS17_DR002', 1); 
arLoadData('Merkle_RS17_DR003', 1); 
arLoadData('Merkle_RS17_DR004', 1); 
arLoadData('Merkle_RS17_DR005', 1); 
arLoadData('Merkle_RS17_DR006', 1); 
arLoadData('Merkle_RS17_DR007', 1); 
arLoadData('Merkle_RS17_DR008', 1); 
arLoadData('Merkle_RS17_DR009', 1); 
arLoadData('Merkle_RS17_DR010', 1); 
arLoadData('Merkle_RS17_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS17__Final', false, true); 

