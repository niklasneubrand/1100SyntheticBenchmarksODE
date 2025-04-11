% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS49 
% Random seed:		0002249000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS49'); 

% Load the time-course data 
arLoadData('Merkle_RS49_TC001', 1); 
arLoadData('Merkle_RS49_TC002', 1); 
arLoadData('Merkle_RS49_TC003', 1); 
arLoadData('Merkle_RS49_TC004', 1); 
arLoadData('Merkle_RS49_TC005', 1); 
arLoadData('Merkle_RS49_TC006', 1); 
arLoadData('Merkle_RS49_TC007', 1); 
arLoadData('Merkle_RS49_TC008', 1); 
arLoadData('Merkle_RS49_TC009', 1); 
arLoadData('Merkle_RS49_TC010', 1); 
arLoadData('Merkle_RS49_TC011', 1); 
arLoadData('Merkle_RS49_TC012', 1); 
arLoadData('Merkle_RS49_TC013', 1); 
arLoadData('Merkle_RS49_TC014', 1); 
arLoadData('Merkle_RS49_TC015', 1); 
arLoadData('Merkle_RS49_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS49_DR001', 1); 
arLoadData('Merkle_RS49_DR002', 1); 
arLoadData('Merkle_RS49_DR003', 1); 
arLoadData('Merkle_RS49_DR004', 1); 
arLoadData('Merkle_RS49_DR005', 1); 
arLoadData('Merkle_RS49_DR006', 1); 
arLoadData('Merkle_RS49_DR007', 1); 
arLoadData('Merkle_RS49_DR008', 1); 
arLoadData('Merkle_RS49_DR009', 1); 
arLoadData('Merkle_RS49_DR010', 1); 
arLoadData('Merkle_RS49_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS49__Final', false, true); 

