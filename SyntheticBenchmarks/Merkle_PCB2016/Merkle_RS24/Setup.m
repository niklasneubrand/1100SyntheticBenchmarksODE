% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS24 
% Random seed:		0002224000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS24'); 

% Load the time-course data 
arLoadData('Merkle_RS24_TC001', 1); 
arLoadData('Merkle_RS24_TC002', 1); 
arLoadData('Merkle_RS24_TC003', 1); 
arLoadData('Merkle_RS24_TC004', 1); 
arLoadData('Merkle_RS24_TC005', 1); 
arLoadData('Merkle_RS24_TC006', 1); 
arLoadData('Merkle_RS24_TC007', 1); 
arLoadData('Merkle_RS24_TC008', 1); 
arLoadData('Merkle_RS24_TC009', 1); 
arLoadData('Merkle_RS24_TC010', 1); 
arLoadData('Merkle_RS24_TC011', 1); 
arLoadData('Merkle_RS24_TC012', 1); 
arLoadData('Merkle_RS24_TC013', 1); 
arLoadData('Merkle_RS24_TC014', 1); 
arLoadData('Merkle_RS24_TC015', 1); 
arLoadData('Merkle_RS24_TC016', 1); 
arLoadData('Merkle_RS24_TC017', 1); 
arLoadData('Merkle_RS24_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS24_DR001', 1); 
arLoadData('Merkle_RS24_DR002', 1); 
arLoadData('Merkle_RS24_DR003', 1); 
arLoadData('Merkle_RS24_DR004', 1); 
arLoadData('Merkle_RS24_DR005', 1); 
arLoadData('Merkle_RS24_DR006', 1); 
arLoadData('Merkle_RS24_DR007', 1); 
arLoadData('Merkle_RS24_DR008', 1); 
arLoadData('Merkle_RS24_DR009', 1); 
arLoadData('Merkle_RS24_DR010', 1); 
arLoadData('Merkle_RS24_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS24__Final', false, true); 

