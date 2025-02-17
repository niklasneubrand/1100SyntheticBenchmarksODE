% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS01 
% Random seed:		0000401000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS01'); 

% Load the time-course data 
arLoadData('Borghans_RS01_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS01__Final', false, true); 

