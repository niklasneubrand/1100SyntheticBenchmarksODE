% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS01 
% Random seed:		0001901000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS01'); 

% Load the time-course data 
arLoadData('Bachmann_RS01_TC001', 1); 
arLoadData('Bachmann_RS01_TC002', 1); 
arLoadData('Bachmann_RS01_TC003', 1); 
arLoadData('Bachmann_RS01_TC004', 1); 
arLoadData('Bachmann_RS01_TC005', 1); 
arLoadData('Bachmann_RS01_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS01_DR001', 1); 
arLoadData('Bachmann_RS01_DR002', 1); 
arLoadData('Bachmann_RS01_DR003', 1); 
arLoadData('Bachmann_RS01_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS01__Final', false, true); 

