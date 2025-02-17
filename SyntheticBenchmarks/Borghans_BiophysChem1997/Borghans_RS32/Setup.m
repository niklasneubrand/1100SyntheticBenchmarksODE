% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS32 
% Random seed:		0000432000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS32'); 

% Load the time-course data 
arLoadData('Borghans_RS32_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS32__Final', false, true); 

