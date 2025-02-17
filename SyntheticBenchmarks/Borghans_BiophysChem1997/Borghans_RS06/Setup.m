% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS06 
% Random seed:		0000406000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS06'); 

% Load the time-course data 
arLoadData('Borghans_RS06_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS06__Final', false, true); 

