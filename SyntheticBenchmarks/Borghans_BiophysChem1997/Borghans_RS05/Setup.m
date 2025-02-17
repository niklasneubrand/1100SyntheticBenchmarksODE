% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS05 
% Random seed:		0000405000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS05'); 

% Load the time-course data 
arLoadData('Borghans_RS05_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS05__Final', false, true); 

