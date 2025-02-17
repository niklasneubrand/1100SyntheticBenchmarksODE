% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS07 
% Random seed:		0000407000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS07'); 

% Load the time-course data 
arLoadData('Borghans_RS07_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS07__Final', false, true); 

