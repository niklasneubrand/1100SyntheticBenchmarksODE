% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS37 
% Random seed:		0001937000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS37'); 

% Load the time-course data 
arLoadData('Bachmann_RS37_TC001', 1); 
arLoadData('Bachmann_RS37_TC002', 1); 
arLoadData('Bachmann_RS37_TC003', 1); 
arLoadData('Bachmann_RS37_TC004', 1); 
arLoadData('Bachmann_RS37_TC005', 1); 
arLoadData('Bachmann_RS37_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS37_DR001', 1); 
arLoadData('Bachmann_RS37_DR002', 1); 
arLoadData('Bachmann_RS37_DR003', 1); 
arLoadData('Bachmann_RS37_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS37__Final', false, true); 

