% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS09 
% Random seed:		0002209000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS09'); 

% Load the time-course data 
arLoadData('Merkle_RS09_TC001', 1); 
arLoadData('Merkle_RS09_TC002', 1); 
arLoadData('Merkle_RS09_TC003', 1); 
arLoadData('Merkle_RS09_TC004', 1); 
arLoadData('Merkle_RS09_TC005', 1); 
arLoadData('Merkle_RS09_TC006', 1); 
arLoadData('Merkle_RS09_TC007', 1); 
arLoadData('Merkle_RS09_TC008', 1); 
arLoadData('Merkle_RS09_TC009', 1); 
arLoadData('Merkle_RS09_TC010', 1); 
arLoadData('Merkle_RS09_TC011', 1); 
arLoadData('Merkle_RS09_TC012', 1); 
arLoadData('Merkle_RS09_TC013', 1); 
arLoadData('Merkle_RS09_TC014', 1); 
arLoadData('Merkle_RS09_TC015', 1); 
arLoadData('Merkle_RS09_TC016', 1); 
arLoadData('Merkle_RS09_TC017', 1); 
arLoadData('Merkle_RS09_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS09_DR001', 1); 
arLoadData('Merkle_RS09_DR002', 1); 
arLoadData('Merkle_RS09_DR003', 1); 
arLoadData('Merkle_RS09_DR004', 1); 
arLoadData('Merkle_RS09_DR005', 1); 
arLoadData('Merkle_RS09_DR006', 1); 
arLoadData('Merkle_RS09_DR007', 1); 
arLoadData('Merkle_RS09_DR008', 1); 
arLoadData('Merkle_RS09_DR009', 1); 
arLoadData('Merkle_RS09_DR010', 1); 
arLoadData('Merkle_RS09_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS09__Final', false, true); 

