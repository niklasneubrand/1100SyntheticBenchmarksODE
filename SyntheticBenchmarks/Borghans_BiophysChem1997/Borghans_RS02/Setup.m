% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS02 
% Random seed:		0000402000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS02'); 

% Load the time-course data 
arLoadData('Borghans_RS02_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS02__Final', false, true); 

