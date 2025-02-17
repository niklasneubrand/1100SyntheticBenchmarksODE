% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS08 
% Random seed:		0000408000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS08'); 

% Load the time-course data 
arLoadData('Borghans_RS08_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS08__Final', false, true); 

