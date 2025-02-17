% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS23 
% Random seed:		0001923000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS23'); 

% Load the time-course data 
arLoadData('Bachmann_RS23_TC001', 1); 
arLoadData('Bachmann_RS23_TC002', 1); 
arLoadData('Bachmann_RS23_TC003', 1); 
arLoadData('Bachmann_RS23_TC004', 1); 
arLoadData('Bachmann_RS23_TC005', 1); 
arLoadData('Bachmann_RS23_TC006', 1); 
arLoadData('Bachmann_RS23_TC007', 1); 
arLoadData('Bachmann_RS23_TC008', 1); 
arLoadData('Bachmann_RS23_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS23_DR001', 1); 
arLoadData('Bachmann_RS23_DR002', 1); 
arLoadData('Bachmann_RS23_DR003', 1); 
arLoadData('Bachmann_RS23_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS23__Final', false, true); 

