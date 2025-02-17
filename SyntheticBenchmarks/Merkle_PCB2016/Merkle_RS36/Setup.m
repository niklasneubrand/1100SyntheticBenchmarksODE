% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS36 
% Random seed:		0002236000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS36'); 

% Load the time-course data 
arLoadData('Merkle_RS36_TC001', 1); 
arLoadData('Merkle_RS36_TC002', 1); 
arLoadData('Merkle_RS36_TC003', 1); 
arLoadData('Merkle_RS36_TC004', 1); 
arLoadData('Merkle_RS36_TC005', 1); 
arLoadData('Merkle_RS36_TC006', 1); 
arLoadData('Merkle_RS36_TC007', 1); 
arLoadData('Merkle_RS36_TC008', 1); 
arLoadData('Merkle_RS36_TC009', 1); 
arLoadData('Merkle_RS36_TC010', 1); 
arLoadData('Merkle_RS36_TC011', 1); 
arLoadData('Merkle_RS36_TC012', 1); 
arLoadData('Merkle_RS36_TC013', 1); 
arLoadData('Merkle_RS36_TC014', 1); 
arLoadData('Merkle_RS36_TC015', 1); 
arLoadData('Merkle_RS36_TC016', 1); 
arLoadData('Merkle_RS36_TC017', 1); 
arLoadData('Merkle_RS36_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS36_DR001', 1); 
arLoadData('Merkle_RS36_DR002', 1); 
arLoadData('Merkle_RS36_DR003', 1); 
arLoadData('Merkle_RS36_DR004', 1); 
arLoadData('Merkle_RS36_DR005', 1); 
arLoadData('Merkle_RS36_DR006', 1); 
arLoadData('Merkle_RS36_DR007', 1); 
arLoadData('Merkle_RS36_DR008', 1); 
arLoadData('Merkle_RS36_DR009', 1); 
arLoadData('Merkle_RS36_DR010', 1); 
arLoadData('Merkle_RS36_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS36__Final', false, true); 

