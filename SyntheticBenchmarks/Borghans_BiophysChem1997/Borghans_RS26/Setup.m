% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS26 
% Random seed:		0000426000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS26'); 

% Load the time-course data 
arLoadData('Borghans_RS26_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS26__Final', false, true); 

