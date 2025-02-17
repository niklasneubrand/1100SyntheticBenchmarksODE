% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS27 
% Random seed:		0000427000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS27'); 

% Load the time-course data 
arLoadData('Borghans_RS27_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS27__Final', false, true); 

