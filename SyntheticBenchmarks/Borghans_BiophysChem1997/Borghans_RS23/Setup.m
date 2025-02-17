% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS23 
% Random seed:		0000423000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS23'); 

% Load the time-course data 
arLoadData('Borghans_RS23_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS23__Final', false, true); 

