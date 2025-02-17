% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS03 
% Random seed:		0000403000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS03'); 

% Load the time-course data 
arLoadData('Borghans_RS03_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS03__Final', false, true); 

