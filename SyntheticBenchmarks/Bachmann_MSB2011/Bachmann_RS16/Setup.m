% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS16 
% Random seed:		0001916000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS16'); 

% Load the time-course data 
arLoadData('Bachmann_RS16_TC001', 1); 
arLoadData('Bachmann_RS16_TC002', 1); 
arLoadData('Bachmann_RS16_TC003', 1); 
arLoadData('Bachmann_RS16_TC004', 1); 
arLoadData('Bachmann_RS16_TC005', 1); 
arLoadData('Bachmann_RS16_TC006', 1); 
arLoadData('Bachmann_RS16_TC007', 1); 
arLoadData('Bachmann_RS16_TC008', 1); 
arLoadData('Bachmann_RS16_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS16_DR001', 1); 
arLoadData('Bachmann_RS16_DR002', 1); 
arLoadData('Bachmann_RS16_DR003', 1); 
arLoadData('Bachmann_RS16_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS16__Final', false, true); 

