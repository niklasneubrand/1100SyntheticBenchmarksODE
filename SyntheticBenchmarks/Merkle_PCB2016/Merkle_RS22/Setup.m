% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS22 
% Random seed:		0002222000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS22'); 

% Load the time-course data 
arLoadData('Merkle_RS22_TC001', 1); 
arLoadData('Merkle_RS22_TC002', 1); 
arLoadData('Merkle_RS22_TC003', 1); 
arLoadData('Merkle_RS22_TC004', 1); 
arLoadData('Merkle_RS22_TC005', 1); 
arLoadData('Merkle_RS22_TC006', 1); 
arLoadData('Merkle_RS22_TC007', 1); 
arLoadData('Merkle_RS22_TC008', 1); 
arLoadData('Merkle_RS22_TC009', 1); 
arLoadData('Merkle_RS22_TC010', 1); 
arLoadData('Merkle_RS22_TC011', 1); 
arLoadData('Merkle_RS22_TC012', 1); 
arLoadData('Merkle_RS22_TC013', 1); 
arLoadData('Merkle_RS22_TC014', 1); 
arLoadData('Merkle_RS22_TC015', 1); 
arLoadData('Merkle_RS22_TC016', 1); 
arLoadData('Merkle_RS22_TC017', 1); 
arLoadData('Merkle_RS22_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS22_DR001', 1); 
arLoadData('Merkle_RS22_DR002', 1); 
arLoadData('Merkle_RS22_DR003', 1); 
arLoadData('Merkle_RS22_DR004', 1); 
arLoadData('Merkle_RS22_DR005', 1); 
arLoadData('Merkle_RS22_DR006', 1); 
arLoadData('Merkle_RS22_DR007', 1); 
arLoadData('Merkle_RS22_DR008', 1); 
arLoadData('Merkle_RS22_DR009', 1); 
arLoadData('Merkle_RS22_DR010', 1); 
arLoadData('Merkle_RS22_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS22__Final', false, true); 

