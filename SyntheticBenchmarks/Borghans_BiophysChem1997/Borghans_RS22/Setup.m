% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS22 
% Random seed:		0000422000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS22'); 

% Load the time-course data 
arLoadData('Borghans_RS22_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS22__Final', false, true); 

