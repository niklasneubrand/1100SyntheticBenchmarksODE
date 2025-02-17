% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS48 
% Random seed:		0000448000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS48'); 

% Load the time-course data 
arLoadData('Borghans_RS48_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS48__Final', false, true); 

