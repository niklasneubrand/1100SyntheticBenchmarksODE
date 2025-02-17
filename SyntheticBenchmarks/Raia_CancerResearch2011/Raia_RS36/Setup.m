% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS36 
% Random seed:		0001236000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS36'); 

% Load the time-course data 
arLoadData('Raia_RS36_TC001', 1); 
arLoadData('Raia_RS36_TC002', 1); 
arLoadData('Raia_RS36_TC003', 1); 
arLoadData('Raia_RS36_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS36__Final', false, true); 

