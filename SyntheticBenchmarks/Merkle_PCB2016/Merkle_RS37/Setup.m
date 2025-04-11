% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS37 
% Random seed:		0002237000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS37'); 

% Load the time-course data 
arLoadData('Merkle_RS37_TC001', 1); 
arLoadData('Merkle_RS37_TC002', 1); 
arLoadData('Merkle_RS37_TC003', 1); 
arLoadData('Merkle_RS37_TC004', 1); 
arLoadData('Merkle_RS37_TC005', 1); 
arLoadData('Merkle_RS37_TC006', 1); 
arLoadData('Merkle_RS37_TC007', 1); 
arLoadData('Merkle_RS37_TC008', 1); 
arLoadData('Merkle_RS37_TC009', 1); 
arLoadData('Merkle_RS37_TC010', 1); 
arLoadData('Merkle_RS37_TC011', 1); 
arLoadData('Merkle_RS37_TC012', 1); 
arLoadData('Merkle_RS37_TC013', 1); 
arLoadData('Merkle_RS37_TC014', 1); 
arLoadData('Merkle_RS37_TC015', 1); 
arLoadData('Merkle_RS37_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS37_DR001', 1); 
arLoadData('Merkle_RS37_DR002', 1); 
arLoadData('Merkle_RS37_DR003', 1); 
arLoadData('Merkle_RS37_DR004', 1); 
arLoadData('Merkle_RS37_DR005', 1); 
arLoadData('Merkle_RS37_DR006', 1); 
arLoadData('Merkle_RS37_DR007', 1); 
arLoadData('Merkle_RS37_DR008', 1); 
arLoadData('Merkle_RS37_DR009', 1); 
arLoadData('Merkle_RS37_DR010', 1); 
arLoadData('Merkle_RS37_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS37__Final', false, true); 

