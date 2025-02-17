% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS41 
% Random seed:		0000441000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS41'); 

% Load the time-course data 
arLoadData('Borghans_RS41_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS41__Final', false, true); 

