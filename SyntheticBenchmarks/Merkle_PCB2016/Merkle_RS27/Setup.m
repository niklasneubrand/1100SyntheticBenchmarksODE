% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS27 
% Random seed:		0002227000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS27'); 

% Load the time-course data 
arLoadData('Merkle_RS27_TC001', 1); 
arLoadData('Merkle_RS27_TC002', 1); 
arLoadData('Merkle_RS27_TC003', 1); 
arLoadData('Merkle_RS27_TC004', 1); 
arLoadData('Merkle_RS27_TC005', 1); 
arLoadData('Merkle_RS27_TC006', 1); 
arLoadData('Merkle_RS27_TC007', 1); 
arLoadData('Merkle_RS27_TC008', 1); 
arLoadData('Merkle_RS27_TC009', 1); 
arLoadData('Merkle_RS27_TC010', 1); 
arLoadData('Merkle_RS27_TC011', 1); 
arLoadData('Merkle_RS27_TC012', 1); 
arLoadData('Merkle_RS27_TC013', 1); 
arLoadData('Merkle_RS27_TC014', 1); 
arLoadData('Merkle_RS27_TC015', 1); 
arLoadData('Merkle_RS27_TC016', 1); 
arLoadData('Merkle_RS27_TC017', 1); 
arLoadData('Merkle_RS27_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS27_DR001', 1); 
arLoadData('Merkle_RS27_DR002', 1); 
arLoadData('Merkle_RS27_DR003', 1); 
arLoadData('Merkle_RS27_DR004', 1); 
arLoadData('Merkle_RS27_DR005', 1); 
arLoadData('Merkle_RS27_DR006', 1); 
arLoadData('Merkle_RS27_DR007', 1); 
arLoadData('Merkle_RS27_DR008', 1); 
arLoadData('Merkle_RS27_DR009', 1); 
arLoadData('Merkle_RS27_DR010', 1); 
arLoadData('Merkle_RS27_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS27__Final', false, true); 

