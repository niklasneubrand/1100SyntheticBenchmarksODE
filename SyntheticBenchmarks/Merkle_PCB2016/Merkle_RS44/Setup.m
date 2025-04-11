% Setup File For Realistic Simulation
% Original project:	Merkle_PCB2016 
% RS project name:	Merkle_RS44 
% Random seed:		0002244000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Merkle_RS44'); 

% Load the time-course data 
arLoadData('Merkle_RS44_TC001', 1); 
arLoadData('Merkle_RS44_TC002', 1); 
arLoadData('Merkle_RS44_TC003', 1); 
arLoadData('Merkle_RS44_TC004', 1); 
arLoadData('Merkle_RS44_TC005', 1); 
arLoadData('Merkle_RS44_TC006', 1); 
arLoadData('Merkle_RS44_TC007', 1); 
arLoadData('Merkle_RS44_TC008', 1); 
arLoadData('Merkle_RS44_TC009', 1); 
arLoadData('Merkle_RS44_TC010', 1); 
arLoadData('Merkle_RS44_TC011', 1); 
arLoadData('Merkle_RS44_TC012', 1); 
arLoadData('Merkle_RS44_TC013', 1); 
arLoadData('Merkle_RS44_TC014', 1); 
arLoadData('Merkle_RS44_TC015', 1); 
arLoadData('Merkle_RS44_TC016', 1); 

% Load the dose-response data 
arLoadData('Merkle_RS44_DR001', 1); 
arLoadData('Merkle_RS44_DR002', 1); 
arLoadData('Merkle_RS44_DR003', 1); 
arLoadData('Merkle_RS44_DR004', 1); 
arLoadData('Merkle_RS44_DR005', 1); 
arLoadData('Merkle_RS44_DR006', 1); 
arLoadData('Merkle_RS44_DR007', 1); 
arLoadData('Merkle_RS44_DR008', 1); 
arLoadData('Merkle_RS44_DR009', 1); 
arLoadData('Merkle_RS44_DR010', 1); 
arLoadData('Merkle_RS44_DR011', 1); 

% Compile the project 
arCompileAll(); 

% Pre-equilibration and Events 
arFindInputs(); 

% Save the project 
arSave('Merkle_RS44__Final', false, true); 

