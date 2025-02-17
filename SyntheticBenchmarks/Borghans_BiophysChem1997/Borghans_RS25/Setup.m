% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS25 
% Random seed:		0000425000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS25'); 

% Load the time-course data 
arLoadData('Borghans_RS25_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS25__Final', false, true); 

