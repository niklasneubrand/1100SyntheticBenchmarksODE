% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS12 
% Random seed:		0001912000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS12'); 

% Load the time-course data 
arLoadData('Bachmann_RS12_TC001', 1); 
arLoadData('Bachmann_RS12_TC002', 1); 
arLoadData('Bachmann_RS12_TC003', 1); 
arLoadData('Bachmann_RS12_TC004', 1); 
arLoadData('Bachmann_RS12_TC005', 1); 
arLoadData('Bachmann_RS12_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS12_DR001', 1); 
arLoadData('Bachmann_RS12_DR002', 1); 
arLoadData('Bachmann_RS12_DR003', 1); 
arLoadData('Bachmann_RS12_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS12__Final', false, true); 

