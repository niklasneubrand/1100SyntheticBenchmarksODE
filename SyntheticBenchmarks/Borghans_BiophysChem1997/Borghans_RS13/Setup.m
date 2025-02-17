% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS13 
% Random seed:		0000413000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS13'); 

% Load the time-course data 
arLoadData('Borghans_RS13_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS13__Final', false, true); 

