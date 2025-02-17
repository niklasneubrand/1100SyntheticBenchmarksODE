% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS35 
% Random seed:		0000435000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS35'); 

% Load the time-course data 
arLoadData('Borghans_RS35_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS35__Final', false, true); 

