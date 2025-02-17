% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS31 
% Random seed:		0000431000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS31'); 

% Load the time-course data 
arLoadData('Borghans_RS31_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS31__Final', false, true); 

