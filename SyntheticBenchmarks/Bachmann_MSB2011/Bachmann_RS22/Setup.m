% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS22 
% Random seed:		0001922000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS22'); 

% Load the time-course data 
arLoadData('Bachmann_RS22_TC001', 1); 
arLoadData('Bachmann_RS22_TC002', 1); 
arLoadData('Bachmann_RS22_TC003', 1); 
arLoadData('Bachmann_RS22_TC004', 1); 
arLoadData('Bachmann_RS22_TC005', 1); 
arLoadData('Bachmann_RS22_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS22_DR001', 1); 
arLoadData('Bachmann_RS22_DR002', 1); 
arLoadData('Bachmann_RS22_DR003', 1); 
arLoadData('Bachmann_RS22_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS22__Final', false, true); 

