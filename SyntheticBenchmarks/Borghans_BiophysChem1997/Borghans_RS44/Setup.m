% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS44 
% Random seed:		0000444000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS44'); 

% Load the time-course data 
arLoadData('Borghans_RS44_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS44__Final', false, true); 

