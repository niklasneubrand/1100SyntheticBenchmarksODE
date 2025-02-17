% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS08 
% Random seed:		0002208000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS08'); 

% Load the time-course data 
arLoadData('Merkle_RS08_TC001', 1); 
arLoadData('Merkle_RS08_TC002', 1); 
arLoadData('Merkle_RS08_TC003', 1); 
arLoadData('Merkle_RS08_TC004', 1); 
arLoadData('Merkle_RS08_TC005', 1); 
arLoadData('Merkle_RS08_TC006', 1); 
arLoadData('Merkle_RS08_TC007', 1); 
arLoadData('Merkle_RS08_TC008', 1); 
arLoadData('Merkle_RS08_TC009', 1); 
arLoadData('Merkle_RS08_TC010', 1); 
arLoadData('Merkle_RS08_TC011', 1); 
arLoadData('Merkle_RS08_TC012', 1); 
arLoadData('Merkle_RS08_TC013', 1); 
arLoadData('Merkle_RS08_TC014', 1); 
arLoadData('Merkle_RS08_TC015', 1); 
arLoadData('Merkle_RS08_TC016', 1); 
arLoadData('Merkle_RS08_TC017', 1); 
arLoadData('Merkle_RS08_TC018', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS08_DR001', 1); 
arLoadData('Merkle_RS08_DR002', 1); 
arLoadData('Merkle_RS08_DR003', 1); 
arLoadData('Merkle_RS08_DR004', 1); 
arLoadData('Merkle_RS08_DR005', 1); 
arLoadData('Merkle_RS08_DR006', 1); 
arLoadData('Merkle_RS08_DR007', 1); 
arLoadData('Merkle_RS08_DR008', 1); 
arLoadData('Merkle_RS08_DR009', 1); 
arLoadData('Merkle_RS08_DR010', 1); 
arLoadData('Merkle_RS08_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS08__Final', false, true); 

