% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS50 
% Random seed:		0001950000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS50'); 

% Load the time-course data 
arLoadData('Bachmann_RS50_TC001', 1); 
arLoadData('Bachmann_RS50_TC002', 1); 
arLoadData('Bachmann_RS50_TC003', 1); 
arLoadData('Bachmann_RS50_TC004', 1); 
arLoadData('Bachmann_RS50_TC005', 1); 
arLoadData('Bachmann_RS50_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS50_DR001', 1); 
arLoadData('Bachmann_RS50_DR002', 1); 
arLoadData('Bachmann_RS50_DR003', 1); 
arLoadData('Bachmann_RS50_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS50__Final', false, true); 

