% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS15 
% Random seed:		0000415000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS15'); 

% Load the time-course data 
arLoadData('Borghans_RS15_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS15__Final', false, true); 

