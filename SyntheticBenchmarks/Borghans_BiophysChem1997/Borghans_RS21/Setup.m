% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS21 
% Random seed:		0000421000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS21'); 

% Load the time-course data 
arLoadData('Borghans_RS21_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS21__Final', false, true); 

