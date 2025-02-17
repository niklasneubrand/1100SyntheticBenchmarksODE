% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS30 
% Random seed:		0000430000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS30'); 

% Load the time-course data 
arLoadData('Borghans_RS30_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS30__Final', false, true); 

