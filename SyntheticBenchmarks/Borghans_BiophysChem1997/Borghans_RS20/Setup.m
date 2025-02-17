% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS20 
% Random seed:		0000420000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS20'); 

% Load the time-course data 
arLoadData('Borghans_RS20_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS20__Final', false, true); 

