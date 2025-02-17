% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS34 
% Random seed:		0000434000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS34'); 

% Load the time-course data 
arLoadData('Borghans_RS34_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS34__Final', false, true); 

