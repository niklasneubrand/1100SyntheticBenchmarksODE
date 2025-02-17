% Setup File For Realistic Simulation
% Original project:	Elowitz_Nature2000 
% RS project name:	Elowitz_RS42 
% Random seed:		0000842000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Elowitz_RS42'); 

% Load the time-course data 
arLoadData('Elowitz_RS42_TC001', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Elowitz_RS42__Final', false, true); 

