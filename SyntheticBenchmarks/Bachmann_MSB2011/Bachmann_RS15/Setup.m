% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS15 
% Random seed:		0001915000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS15'); 

% Load the time-course data 
arLoadData('Bachmann_RS15_TC001', 1); 
arLoadData('Bachmann_RS15_TC002', 1); 
arLoadData('Bachmann_RS15_TC003', 1); 
arLoadData('Bachmann_RS15_TC004', 1); 
arLoadData('Bachmann_RS15_TC005', 1); 
arLoadData('Bachmann_RS15_TC006', 1); 
arLoadData('Bachmann_RS15_TC007', 1); 
arLoadData('Bachmann_RS15_TC008', 1); 
arLoadData('Bachmann_RS15_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS15_DR001', 1); 
arLoadData('Bachmann_RS15_DR002', 1); 
arLoadData('Bachmann_RS15_DR003', 1); 
arLoadData('Bachmann_RS15_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS15__Final', false, true); 

