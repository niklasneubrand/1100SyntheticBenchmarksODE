% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS04 
% Random seed:		0000404000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS04'); 

% Load the time-course data 
arLoadData('Borghans_RS04_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS04__Final', false, true); 

