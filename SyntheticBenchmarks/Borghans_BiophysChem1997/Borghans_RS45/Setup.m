% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS45 
% Random seed:		0000445000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS45'); 

% Load the time-course data 
arLoadData('Borghans_RS45_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS45__Final', false, true); 

