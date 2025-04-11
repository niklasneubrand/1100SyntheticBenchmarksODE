% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS30 
% Random seed:		0001930000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS30'); 

% Load the time-course data 
arLoadData('Bachmann_RS30_TC001', 1); 
arLoadData('Bachmann_RS30_TC002', 1); 
arLoadData('Bachmann_RS30_TC003', 1); 
arLoadData('Bachmann_RS30_TC004', 1); 
arLoadData('Bachmann_RS30_TC005', 1); 
arLoadData('Bachmann_RS30_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS30_DR001', 1); 
arLoadData('Bachmann_RS30_DR002', 1); 
arLoadData('Bachmann_RS30_DR003', 1); 
arLoadData('Bachmann_RS30_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS30__Final', false, true); 

