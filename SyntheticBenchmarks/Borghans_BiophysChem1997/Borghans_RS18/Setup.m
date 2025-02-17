% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS18 
% Random seed:		0000418000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS18'); 

% Load the time-course data 
arLoadData('Borghans_RS18_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS18__Final', false, true); 

