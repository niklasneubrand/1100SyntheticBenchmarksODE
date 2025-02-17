% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS34 
% Random seed:		0002234000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS34'); 

% Load the time-course data 
arLoadData('Merkle_RS34_TC001', 1); 
arLoadData('Merkle_RS34_TC002', 1); 
arLoadData('Merkle_RS34_TC003', 1); 
arLoadData('Merkle_RS34_TC004', 1); 
arLoadData('Merkle_RS34_TC005', 1); 
arLoadData('Merkle_RS34_TC006', 1); 
arLoadData('Merkle_RS34_TC007', 1); 
arLoadData('Merkle_RS34_TC008', 1); 
arLoadData('Merkle_RS34_TC009', 1); 
arLoadData('Merkle_RS34_TC010', 1); 
arLoadData('Merkle_RS34_TC011', 1); 
arLoadData('Merkle_RS34_TC012', 1); 
arLoadData('Merkle_RS34_TC013', 1); 
arLoadData('Merkle_RS34_TC014', 1); 
arLoadData('Merkle_RS34_TC015', 1); 
arLoadData('Merkle_RS34_TC016', 1); 
arLoadData('Merkle_RS34_TC017', 1); 
arLoadData('Merkle_RS34_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS34_DR001', 1); 
arLoadData('Merkle_RS34_DR002', 1); 
arLoadData('Merkle_RS34_DR003', 1); 
arLoadData('Merkle_RS34_DR004', 1); 
arLoadData('Merkle_RS34_DR005', 1); 
arLoadData('Merkle_RS34_DR006', 1); 
arLoadData('Merkle_RS34_DR007', 1); 
arLoadData('Merkle_RS34_DR008', 1); 
arLoadData('Merkle_RS34_DR009', 1); 
arLoadData('Merkle_RS34_DR010', 1); 
arLoadData('Merkle_RS34_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS34__Final', false, true); 

