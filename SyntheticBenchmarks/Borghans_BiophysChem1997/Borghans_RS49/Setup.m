% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS49 
% Random seed:		0000449000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS49'); 

% Load the time-course data 
arLoadData('Borghans_RS49_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS49__Final', false, true); 

