% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS13 
% Random seed:		0001913000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS13'); 

% Load the time-course data 
arLoadData('Bachmann_RS13_TC001', 1); 
arLoadData('Bachmann_RS13_TC002', 1); 
arLoadData('Bachmann_RS13_TC003', 1); 
arLoadData('Bachmann_RS13_TC004', 1); 
arLoadData('Bachmann_RS13_TC005', 1); 
arLoadData('Bachmann_RS13_TC006', 1); 
arLoadData('Bachmann_RS13_TC007', 1); 
arLoadData('Bachmann_RS13_TC008', 1); 
arLoadData('Bachmann_RS13_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS13_DR001', 1); 
arLoadData('Bachmann_RS13_DR002', 1); 
arLoadData('Bachmann_RS13_DR003', 1); 
arLoadData('Bachmann_RS13_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS13__Final', false, true); 

