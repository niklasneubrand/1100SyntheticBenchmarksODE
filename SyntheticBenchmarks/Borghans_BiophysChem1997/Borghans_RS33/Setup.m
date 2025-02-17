% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS33 
% Random seed:		0000433000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS33'); 

% Load the time-course data 
arLoadData('Borghans_RS33_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS33__Final', false, true); 

