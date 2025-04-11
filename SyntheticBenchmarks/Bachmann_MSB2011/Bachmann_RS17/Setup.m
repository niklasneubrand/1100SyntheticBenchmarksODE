% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS17 
% Random seed:		0001917000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS17'); 

% Load the time-course data 
arLoadData('Bachmann_RS17_TC001', 1); 
arLoadData('Bachmann_RS17_TC002', 1); 
arLoadData('Bachmann_RS17_TC003', 1); 
arLoadData('Bachmann_RS17_TC004', 1); 
arLoadData('Bachmann_RS17_TC005', 1); 
arLoadData('Bachmann_RS17_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS17_DR001', 1); 
arLoadData('Bachmann_RS17_DR002', 1); 
arLoadData('Bachmann_RS17_DR003', 1); 
arLoadData('Bachmann_RS17_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS17__Final', false, true); 

