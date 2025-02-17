% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS05 
% Random seed:		0002205000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS05'); 

% Load the time-course data 
arLoadData('Merkle_RS05_TC001', 1); 
arLoadData('Merkle_RS05_TC002', 1); 
arLoadData('Merkle_RS05_TC003', 1); 
arLoadData('Merkle_RS05_TC004', 1); 
arLoadData('Merkle_RS05_TC005', 1); 
arLoadData('Merkle_RS05_TC006', 1); 
arLoadData('Merkle_RS05_TC007', 1); 
arLoadData('Merkle_RS05_TC008', 1); 
arLoadData('Merkle_RS05_TC009', 1); 
arLoadData('Merkle_RS05_TC010', 1); 
arLoadData('Merkle_RS05_TC011', 1); 
arLoadData('Merkle_RS05_TC012', 1); 
arLoadData('Merkle_RS05_TC013', 1); 
arLoadData('Merkle_RS05_TC014', 1); 
arLoadData('Merkle_RS05_TC015', 1); 
arLoadData('Merkle_RS05_TC016', 1); 
arLoadData('Merkle_RS05_TC017', 1); 
arLoadData('Merkle_RS05_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS05_DR001', 1); 
arLoadData('Merkle_RS05_DR002', 1); 
arLoadData('Merkle_RS05_DR003', 1); 
arLoadData('Merkle_RS05_DR004', 1); 
arLoadData('Merkle_RS05_DR005', 1); 
arLoadData('Merkle_RS05_DR006', 1); 
arLoadData('Merkle_RS05_DR007', 1); 
arLoadData('Merkle_RS05_DR008', 1); 
arLoadData('Merkle_RS05_DR009', 1); 
arLoadData('Merkle_RS05_DR010', 1); 
arLoadData('Merkle_RS05_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS05__Final', false, true); 

