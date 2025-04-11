% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS21 
% Random seed:		0001921000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS21'); 

% Load the time-course data 
arLoadData('Bachmann_RS21_TC001', 1); 
arLoadData('Bachmann_RS21_TC002', 1); 
arLoadData('Bachmann_RS21_TC003', 1); 
arLoadData('Bachmann_RS21_TC004', 1); 
arLoadData('Bachmann_RS21_TC005', 1); 
arLoadData('Bachmann_RS21_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS21_DR001', 1); 
arLoadData('Bachmann_RS21_DR002', 1); 
arLoadData('Bachmann_RS21_DR003', 1); 
arLoadData('Bachmann_RS21_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS21__Final', false, true); 

