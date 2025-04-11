% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS11 
% Random seed:		0002211000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS11'); 

% Load the time-course data 
arLoadData('Merkle_RS11_TC001', 1); 
arLoadData('Merkle_RS11_TC002', 1); 
arLoadData('Merkle_RS11_TC003', 1); 
arLoadData('Merkle_RS11_TC004', 1); 
arLoadData('Merkle_RS11_TC005', 1); 
arLoadData('Merkle_RS11_TC006', 1); 
arLoadData('Merkle_RS11_TC007', 1); 
arLoadData('Merkle_RS11_TC008', 1); 
arLoadData('Merkle_RS11_TC009', 1); 
arLoadData('Merkle_RS11_TC010', 1); 
arLoadData('Merkle_RS11_TC011', 1); 
arLoadData('Merkle_RS11_TC012', 1); 
arLoadData('Merkle_RS11_TC013', 1); 
arLoadData('Merkle_RS11_TC014', 1); 
arLoadData('Merkle_RS11_TC015', 1); 
arLoadData('Merkle_RS11_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS11_DR001', 1); 
arLoadData('Merkle_RS11_DR002', 1); 
arLoadData('Merkle_RS11_DR003', 1); 
arLoadData('Merkle_RS11_DR004', 1); 
arLoadData('Merkle_RS11_DR005', 1); 
arLoadData('Merkle_RS11_DR006', 1); 
arLoadData('Merkle_RS11_DR007', 1); 
arLoadData('Merkle_RS11_DR008', 1); 
arLoadData('Merkle_RS11_DR009', 1); 
arLoadData('Merkle_RS11_DR010', 1); 
arLoadData('Merkle_RS11_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS11__Final', false, true); 

