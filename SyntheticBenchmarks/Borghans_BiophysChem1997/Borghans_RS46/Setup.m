% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS46 
% Random seed:		0000446000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS46'); 

% Load the time-course data 
arLoadData('Borghans_RS46_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS46__Final', false, true); 

