% Setup File For Realistic Simulation
% Original project:	Schwen_PlosOne2014 
% RS project name:	Schwen_RS36 
% Random seed:		0001336000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Schwen_RS36'); 

% Load the time-course data 
arLoadData('Schwen_RS36_TC001', 1); 
arLoadData('Schwen_RS36_TC002', 1); 
arLoadData('Schwen_RS36_TC003', 1); 
arLoadData('Schwen_RS36_TC004', 1); 
arLoadData('Schwen_RS36_TC005', 1); 
arLoadData('Schwen_RS36_TC006', 1); 
arLoadData('Schwen_RS36_TC007', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Schwen_RS36__Final', false, true); 

