% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS21 
% Random seed:		0001321000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS21'); 

% Load the time-course data 
arLoadData('Schwen_RS21_TC001', 1); 
arLoadData('Schwen_RS21_TC002', 1); 
arLoadData('Schwen_RS21_TC003', 1); 
arLoadData('Schwen_RS21_TC004', 1); 
arLoadData('Schwen_RS21_TC005', 1); 
arLoadData('Schwen_RS21_TC006', 1); 
arLoadData('Schwen_RS21_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS21__Final', false, true); 

