% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS35 
% Random seed:		0002235000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS35'); 

% Load the time-course data 
arLoadData('Merkle_RS35_TC001', 1); 
arLoadData('Merkle_RS35_TC002', 1); 
arLoadData('Merkle_RS35_TC003', 1); 
arLoadData('Merkle_RS35_TC004', 1); 
arLoadData('Merkle_RS35_TC005', 1); 
arLoadData('Merkle_RS35_TC006', 1); 
arLoadData('Merkle_RS35_TC007', 1); 
arLoadData('Merkle_RS35_TC008', 1); 
arLoadData('Merkle_RS35_TC009', 1); 
arLoadData('Merkle_RS35_TC010', 1); 
arLoadData('Merkle_RS35_TC011', 1); 
arLoadData('Merkle_RS35_TC012', 1); 
arLoadData('Merkle_RS35_TC013', 1); 
arLoadData('Merkle_RS35_TC014', 1); 
arLoadData('Merkle_RS35_TC015', 1); 
arLoadData('Merkle_RS35_TC016', 1); 
arLoadData('Merkle_RS35_TC017', 1); 
arLoadData('Merkle_RS35_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS35_DR001', 1); 
arLoadData('Merkle_RS35_DR002', 1); 
arLoadData('Merkle_RS35_DR003', 1); 
arLoadData('Merkle_RS35_DR004', 1); 
arLoadData('Merkle_RS35_DR005', 1); 
arLoadData('Merkle_RS35_DR006', 1); 
arLoadData('Merkle_RS35_DR007', 1); 
arLoadData('Merkle_RS35_DR008', 1); 
arLoadData('Merkle_RS35_DR009', 1); 
arLoadData('Merkle_RS35_DR010', 1); 
arLoadData('Merkle_RS35_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS35__Final', false, true); 

