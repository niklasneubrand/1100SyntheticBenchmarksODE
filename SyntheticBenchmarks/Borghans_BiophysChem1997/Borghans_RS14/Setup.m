% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS14 
% Random seed:		0000414000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS14'); 

% Load the time-course data 
arLoadData('Borghans_RS14_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS14__Final', false, true); 

