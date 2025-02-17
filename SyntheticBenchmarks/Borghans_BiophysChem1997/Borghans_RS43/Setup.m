% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS43 
% Random seed:		0000443000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS43'); 

% Load the time-course data 
arLoadData('Borghans_RS43_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS43__Final', false, true); 

