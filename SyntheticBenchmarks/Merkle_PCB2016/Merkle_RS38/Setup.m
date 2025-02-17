% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS38 
% Random seed:		0002238000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS38'); 

% Load the time-course data 
arLoadData('Merkle_RS38_TC001', 1); 
arLoadData('Merkle_RS38_TC002', 1); 
arLoadData('Merkle_RS38_TC003', 1); 
arLoadData('Merkle_RS38_TC004', 1); 
arLoadData('Merkle_RS38_TC005', 1); 
arLoadData('Merkle_RS38_TC006', 1); 
arLoadData('Merkle_RS38_TC007', 1); 
arLoadData('Merkle_RS38_TC008', 1); 
arLoadData('Merkle_RS38_TC009', 1); 
arLoadData('Merkle_RS38_TC010', 1); 
arLoadData('Merkle_RS38_TC011', 1); 
arLoadData('Merkle_RS38_TC012', 1); 
arLoadData('Merkle_RS38_TC013', 1); 
arLoadData('Merkle_RS38_TC014', 1); 
arLoadData('Merkle_RS38_TC015', 1); 
arLoadData('Merkle_RS38_TC016', 1); 
arLoadData('Merkle_RS38_TC017', 1); 
arLoadData('Merkle_RS38_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS38_DR001', 1); 
arLoadData('Merkle_RS38_DR002', 1); 
arLoadData('Merkle_RS38_DR003', 1); 
arLoadData('Merkle_RS38_DR004', 1); 
arLoadData('Merkle_RS38_DR005', 1); 
arLoadData('Merkle_RS38_DR006', 1); 
arLoadData('Merkle_RS38_DR007', 1); 
arLoadData('Merkle_RS38_DR008', 1); 
arLoadData('Merkle_RS38_DR009', 1); 
arLoadData('Merkle_RS38_DR010', 1); 
arLoadData('Merkle_RS38_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS38__Final', false, true); 

