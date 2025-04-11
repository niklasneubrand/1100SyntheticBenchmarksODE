% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS14 
% Random seed:		0001914000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS14'); 

% Load the time-course data 
arLoadData('Bachmann_RS14_TC001', 1); 
arLoadData('Bachmann_RS14_TC002', 1); 
arLoadData('Bachmann_RS14_TC003', 1); 
arLoadData('Bachmann_RS14_TC004', 1); 
arLoadData('Bachmann_RS14_TC005', 1); 
arLoadData('Bachmann_RS14_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS14_DR001', 1); 
arLoadData('Bachmann_RS14_DR002', 1); 
arLoadData('Bachmann_RS14_DR003', 1); 
arLoadData('Bachmann_RS14_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS14__Final', false, true); 

