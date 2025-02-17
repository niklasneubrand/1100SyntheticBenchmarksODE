% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS12 
% Random seed:		0000412000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS12'); 

% Load the time-course data 
arLoadData('Borghans_RS12_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS12__Final', false, true); 

