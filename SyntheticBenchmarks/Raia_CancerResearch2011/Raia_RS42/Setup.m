% Setup File For Realistic Simulation
% Original project:	Raia_CancerResearch2011 
% RS project name:	Raia_RS42 
% Random seed:		0001242000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Raia_RS42'); 

% Load the time-course data 
arLoadData('Raia_RS42_TC001', 1); 
arLoadData('Raia_RS42_TC002', 1); 
arLoadData('Raia_RS42_TC003', 1); 
arLoadData('Raia_RS42_TC004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Raia_RS42__Final', false, true); 

