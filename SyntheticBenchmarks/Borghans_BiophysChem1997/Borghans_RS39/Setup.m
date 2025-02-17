% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS39 
% Random seed:		0000439000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS39'); 

% Load the time-course data 
arLoadData('Borghans_RS39_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS39__Final', false, true); 

