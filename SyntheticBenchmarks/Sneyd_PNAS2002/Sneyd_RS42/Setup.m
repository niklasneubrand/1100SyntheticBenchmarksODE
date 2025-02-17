% Setup File For Realistic Simulation
% Original project:	Sneyd_PNAS2002 
% RS project name:	Sneyd_RS42 
% Random seed:		0001442000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Sneyd_RS42'); 

% Load the time-course data 
arLoadData('Sneyd_RS42_TC001', 1); 
arLoadData('Sneyd_RS42_TC002', 1); 
arLoadData('Sneyd_RS42_TC003', 1); 
arLoadData('Sneyd_RS42_TC004', 1); 
arLoadData('Sneyd_RS42_TC005', 1); 
arLoadData('Sneyd_RS42_TC006', 1); 
arLoadData('Sneyd_RS42_TC007', 1); 
arLoadData('Sneyd_RS42_TC008', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Sneyd_RS42__Final', false, true); 

