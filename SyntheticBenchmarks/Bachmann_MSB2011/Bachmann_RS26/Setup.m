% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS26 
% Random seed:		0001926000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS26'); 

% Load the time-course data 
arLoadData('Bachmann_RS26_TC001', 1); 
arLoadData('Bachmann_RS26_TC002', 1); 
arLoadData('Bachmann_RS26_TC003', 1); 
arLoadData('Bachmann_RS26_TC004', 1); 
arLoadData('Bachmann_RS26_TC005', 1); 
arLoadData('Bachmann_RS26_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS26_DR001', 1); 
arLoadData('Bachmann_RS26_DR002', 1); 
arLoadData('Bachmann_RS26_DR003', 1); 
arLoadData('Bachmann_RS26_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS26__Final', false, true); 

