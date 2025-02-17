% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS48 
% Random seed:		0001948000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS48'); 

% Load the time-course data 
arLoadData('Bachmann_RS48_TC001', 1); 
arLoadData('Bachmann_RS48_TC002', 1); 
arLoadData('Bachmann_RS48_TC003', 1); 
arLoadData('Bachmann_RS48_TC004', 1); 
arLoadData('Bachmann_RS48_TC005', 1); 
arLoadData('Bachmann_RS48_TC006', 1); 
arLoadData('Bachmann_RS48_TC007', 1); 
arLoadData('Bachmann_RS48_TC008', 1); 
arLoadData('Bachmann_RS48_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS48_DR001', 1); 
arLoadData('Bachmann_RS48_DR002', 1); 
arLoadData('Bachmann_RS48_DR003', 1); 
arLoadData('Bachmann_RS48_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS48__Final', false, true); 

