% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS01 
% Random seed:		0002201000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS01'); 

% Load the time-course data 
arLoadData('Merkle_RS01_TC001', 1); 
arLoadData('Merkle_RS01_TC002', 1); 
arLoadData('Merkle_RS01_TC003', 1); 
arLoadData('Merkle_RS01_TC004', 1); 
arLoadData('Merkle_RS01_TC005', 1); 
arLoadData('Merkle_RS01_TC006', 1); 
arLoadData('Merkle_RS01_TC007', 1); 
arLoadData('Merkle_RS01_TC008', 1); 
arLoadData('Merkle_RS01_TC009', 1); 
arLoadData('Merkle_RS01_TC010', 1); 
arLoadData('Merkle_RS01_TC011', 1); 
arLoadData('Merkle_RS01_TC012', 1); 
arLoadData('Merkle_RS01_TC013', 1); 
arLoadData('Merkle_RS01_TC014', 1); 
arLoadData('Merkle_RS01_TC015', 1); 
arLoadData('Merkle_RS01_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS01_DR001', 1); 
arLoadData('Merkle_RS01_DR002', 1); 
arLoadData('Merkle_RS01_DR003', 1); 
arLoadData('Merkle_RS01_DR004', 1); 
arLoadData('Merkle_RS01_DR005', 1); 
arLoadData('Merkle_RS01_DR006', 1); 
arLoadData('Merkle_RS01_DR007', 1); 
arLoadData('Merkle_RS01_DR008', 1); 
arLoadData('Merkle_RS01_DR009', 1); 
arLoadData('Merkle_RS01_DR010', 1); 
arLoadData('Merkle_RS01_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS01__Final', false, true); 

