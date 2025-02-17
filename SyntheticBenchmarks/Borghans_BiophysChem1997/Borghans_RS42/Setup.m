% Setup File For Realistic Simulation
% Original project:	Borghans_BiophysChem1997 
% RS project name:	Borghans_RS42 
% Random seed:		0000442000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Borghans_RS42'); 

% Load the time-course data 
arLoadData('Borghans_RS42_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Borghans_RS42__Final', false, true); 

