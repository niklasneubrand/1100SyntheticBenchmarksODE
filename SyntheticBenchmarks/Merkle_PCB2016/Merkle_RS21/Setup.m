% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS21 
% Random seed:		0002221000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS21'); 

% Load the time-course data 
arLoadData('Merkle_RS21_TC001', 1); 
arLoadData('Merkle_RS21_TC002', 1); 
arLoadData('Merkle_RS21_TC003', 1); 
arLoadData('Merkle_RS21_TC004', 1); 
arLoadData('Merkle_RS21_TC005', 1); 
arLoadData('Merkle_RS21_TC006', 1); 
arLoadData('Merkle_RS21_TC007', 1); 
arLoadData('Merkle_RS21_TC008', 1); 
arLoadData('Merkle_RS21_TC009', 1); 
arLoadData('Merkle_RS21_TC010', 1); 
arLoadData('Merkle_RS21_TC011', 1); 
arLoadData('Merkle_RS21_TC012', 1); 
arLoadData('Merkle_RS21_TC013', 1); 
arLoadData('Merkle_RS21_TC014', 1); 
arLoadData('Merkle_RS21_TC015', 1); 
arLoadData('Merkle_RS21_TC016', 1); 
arLoadData('Merkle_RS21_TC017', 1); 
arLoadData('Merkle_RS21_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS21_DR001', 1); 
arLoadData('Merkle_RS21_DR002', 1); 
arLoadData('Merkle_RS21_DR003', 1); 
arLoadData('Merkle_RS21_DR004', 1); 
arLoadData('Merkle_RS21_DR005', 1); 
arLoadData('Merkle_RS21_DR006', 1); 
arLoadData('Merkle_RS21_DR007', 1); 
arLoadData('Merkle_RS21_DR008', 1); 
arLoadData('Merkle_RS21_DR009', 1); 
arLoadData('Merkle_RS21_DR010', 1); 
arLoadData('Merkle_RS21_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS21__Final', false, true); 

