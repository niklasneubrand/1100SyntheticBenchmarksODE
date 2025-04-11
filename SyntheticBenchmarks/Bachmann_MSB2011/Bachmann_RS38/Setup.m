% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS38 
% Random seed:		0001938000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS38'); 

% Load the time-course data 
arLoadData('Bachmann_RS38_TC001', 1); 
arLoadData('Bachmann_RS38_TC002', 1); 
arLoadData('Bachmann_RS38_TC003', 1); 
arLoadData('Bachmann_RS38_TC004', 1); 
arLoadData('Bachmann_RS38_TC005', 1); 
arLoadData('Bachmann_RS38_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS38_DR001', 1); 
arLoadData('Bachmann_RS38_DR002', 1); 
arLoadData('Bachmann_RS38_DR003', 1); 
arLoadData('Bachmann_RS38_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS38__Final', false, true); 

