% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS29 
% Random seed:		0000429000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS29'); 

% Load the time-course data 
arLoadData('Borghans_RS29_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS29__Final', false, true); 

