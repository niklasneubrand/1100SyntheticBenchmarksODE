% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS42 
% Random seed:		0001342000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS42'); 

% Load the time-course data 
arLoadData('Schwen_RS42_TC001', 1); 
arLoadData('Schwen_RS42_TC002', 1); 
arLoadData('Schwen_RS42_TC003', 1); 
arLoadData('Schwen_RS42_TC004', 1); 
arLoadData('Schwen_RS42_TC005', 1); 
arLoadData('Schwen_RS42_TC006', 1); 
arLoadData('Schwen_RS42_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS42__Final', false, true); 

