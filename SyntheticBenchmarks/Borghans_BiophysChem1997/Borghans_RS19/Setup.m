% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS19 
% Random seed:		0000419000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS19'); 

% Load the time-course data 
arLoadData('Borghans_RS19_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS19__Final', false, true); 

