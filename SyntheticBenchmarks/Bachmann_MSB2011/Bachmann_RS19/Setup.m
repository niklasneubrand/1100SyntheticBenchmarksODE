% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS19 
% Random seed:		0001919000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS19'); 

% Load the time-course data 
arLoadData('Bachmann_RS19_TC001', 1); 
arLoadData('Bachmann_RS19_TC002', 1); 
arLoadData('Bachmann_RS19_TC003', 1); 
arLoadData('Bachmann_RS19_TC004', 1); 
arLoadData('Bachmann_RS19_TC005', 1); 
arLoadData('Bachmann_RS19_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS19_DR001', 1); 
arLoadData('Bachmann_RS19_DR002', 1); 
arLoadData('Bachmann_RS19_DR003', 1); 
arLoadData('Bachmann_RS19_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS19__Final', false, true); 

