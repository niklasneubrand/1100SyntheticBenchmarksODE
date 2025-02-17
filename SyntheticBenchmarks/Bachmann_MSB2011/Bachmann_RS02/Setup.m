% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS02 
% Random seed:		0001902000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS02'); 

% Load the time-course data 
arLoadData('Bachmann_RS02_TC001', 1); 
arLoadData('Bachmann_RS02_TC002', 1); 
arLoadData('Bachmann_RS02_TC003', 1); 
arLoadData('Bachmann_RS02_TC004', 1); 
arLoadData('Bachmann_RS02_TC005', 1); 
arLoadData('Bachmann_RS02_TC006', 1); 
arLoadData('Bachmann_RS02_TC007', 1); 
arLoadData('Bachmann_RS02_TC008', 1); 
arLoadData('Bachmann_RS02_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS02_DR001', 1); 
arLoadData('Bachmann_RS02_DR002', 1); 
arLoadData('Bachmann_RS02_DR003', 1); 
arLoadData('Bachmann_RS02_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS02__Final', false, true); 

