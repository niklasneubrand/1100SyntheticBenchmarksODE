% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS43 
% Random seed:		0002243000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS43'); 

% Load the time-course data 
arLoadData('Merkle_RS43_TC001', 1); 
arLoadData('Merkle_RS43_TC002', 1); 
arLoadData('Merkle_RS43_TC003', 1); 
arLoadData('Merkle_RS43_TC004', 1); 
arLoadData('Merkle_RS43_TC005', 1); 
arLoadData('Merkle_RS43_TC006', 1); 
arLoadData('Merkle_RS43_TC007', 1); 
arLoadData('Merkle_RS43_TC008', 1); 
arLoadData('Merkle_RS43_TC009', 1); 
arLoadData('Merkle_RS43_TC010', 1); 
arLoadData('Merkle_RS43_TC011', 1); 
arLoadData('Merkle_RS43_TC012', 1); 
arLoadData('Merkle_RS43_TC013', 1); 
arLoadData('Merkle_RS43_TC014', 1); 
arLoadData('Merkle_RS43_TC015', 1); 
arLoadData('Merkle_RS43_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS43_DR001', 1); 
arLoadData('Merkle_RS43_DR002', 1); 
arLoadData('Merkle_RS43_DR003', 1); 
arLoadData('Merkle_RS43_DR004', 1); 
arLoadData('Merkle_RS43_DR005', 1); 
arLoadData('Merkle_RS43_DR006', 1); 
arLoadData('Merkle_RS43_DR007', 1); 
arLoadData('Merkle_RS43_DR008', 1); 
arLoadData('Merkle_RS43_DR009', 1); 
arLoadData('Merkle_RS43_DR010', 1); 
arLoadData('Merkle_RS43_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS43__Final', false, true); 

