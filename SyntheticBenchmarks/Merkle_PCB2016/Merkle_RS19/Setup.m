% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS19 
% Random seed:		0002219000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS19'); 

% Load the time-course data 
arLoadData('Merkle_RS19_TC001', 1); 
arLoadData('Merkle_RS19_TC002', 1); 
arLoadData('Merkle_RS19_TC003', 1); 
arLoadData('Merkle_RS19_TC004', 1); 
arLoadData('Merkle_RS19_TC005', 1); 
arLoadData('Merkle_RS19_TC006', 1); 
arLoadData('Merkle_RS19_TC007', 1); 
arLoadData('Merkle_RS19_TC008', 1); 
arLoadData('Merkle_RS19_TC009', 1); 
arLoadData('Merkle_RS19_TC010', 1); 
arLoadData('Merkle_RS19_TC011', 1); 
arLoadData('Merkle_RS19_TC012', 1); 
arLoadData('Merkle_RS19_TC013', 1); 
arLoadData('Merkle_RS19_TC014', 1); 
arLoadData('Merkle_RS19_TC015', 1); 
arLoadData('Merkle_RS19_TC016', 1); 
arLoadData('Merkle_RS19_TC017', 1); 
arLoadData('Merkle_RS19_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS19_DR001', 1); 
arLoadData('Merkle_RS19_DR002', 1); 
arLoadData('Merkle_RS19_DR003', 1); 
arLoadData('Merkle_RS19_DR004', 1); 
arLoadData('Merkle_RS19_DR005', 1); 
arLoadData('Merkle_RS19_DR006', 1); 
arLoadData('Merkle_RS19_DR007', 1); 
arLoadData('Merkle_RS19_DR008', 1); 
arLoadData('Merkle_RS19_DR009', 1); 
arLoadData('Merkle_RS19_DR010', 1); 
arLoadData('Merkle_RS19_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS19__Final', false, true); 

