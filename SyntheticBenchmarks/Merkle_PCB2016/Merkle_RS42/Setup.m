% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS42 
% Random seed:		0002242000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS42'); 

% Load the time-course data 
arLoadData('Merkle_RS42_TC001', 1); 
arLoadData('Merkle_RS42_TC002', 1); 
arLoadData('Merkle_RS42_TC003', 1); 
arLoadData('Merkle_RS42_TC004', 1); 
arLoadData('Merkle_RS42_TC005', 1); 
arLoadData('Merkle_RS42_TC006', 1); 
arLoadData('Merkle_RS42_TC007', 1); 
arLoadData('Merkle_RS42_TC008', 1); 
arLoadData('Merkle_RS42_TC009', 1); 
arLoadData('Merkle_RS42_TC010', 1); 
arLoadData('Merkle_RS42_TC011', 1); 
arLoadData('Merkle_RS42_TC012', 1); 
arLoadData('Merkle_RS42_TC013', 1); 
arLoadData('Merkle_RS42_TC014', 1); 
arLoadData('Merkle_RS42_TC015', 1); 
arLoadData('Merkle_RS42_TC016', 1); 
arLoadData('Merkle_RS42_TC017', 1); 
arLoadData('Merkle_RS42_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS42_DR001', 1); 
arLoadData('Merkle_RS42_DR002', 1); 
arLoadData('Merkle_RS42_DR003', 1); 
arLoadData('Merkle_RS42_DR004', 1); 
arLoadData('Merkle_RS42_DR005', 1); 
arLoadData('Merkle_RS42_DR006', 1); 
arLoadData('Merkle_RS42_DR007', 1); 
arLoadData('Merkle_RS42_DR008', 1); 
arLoadData('Merkle_RS42_DR009', 1); 
arLoadData('Merkle_RS42_DR010', 1); 
arLoadData('Merkle_RS42_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS42__Final', false, true); 

