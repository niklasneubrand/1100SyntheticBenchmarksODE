% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS47 
% Random seed:		0001947000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS47'); 

% Load the time-course data 
arLoadData('Bachmann_RS47_TC001', 1); 
arLoadData('Bachmann_RS47_TC002', 1); 
arLoadData('Bachmann_RS47_TC003', 1); 
arLoadData('Bachmann_RS47_TC004', 1); 
arLoadData('Bachmann_RS47_TC005', 1); 
arLoadData('Bachmann_RS47_TC006', 1); 
arLoadData('Bachmann_RS47_TC007', 1); 
arLoadData('Bachmann_RS47_TC008', 1); 
arLoadData('Bachmann_RS47_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS47_DR001', 1); 
arLoadData('Bachmann_RS47_DR002', 1); 
arLoadData('Bachmann_RS47_DR003', 1); 
arLoadData('Bachmann_RS47_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS47__Final', false, true); 

