% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS33 
% Random seed:		0001933000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS33'); 

% Load the time-course data 
arLoadData('Bachmann_RS33_TC001', 1); 
arLoadData('Bachmann_RS33_TC002', 1); 
arLoadData('Bachmann_RS33_TC003', 1); 
arLoadData('Bachmann_RS33_TC004', 1); 
arLoadData('Bachmann_RS33_TC005', 1); 
arLoadData('Bachmann_RS33_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS33_DR001', 1); 
arLoadData('Bachmann_RS33_DR002', 1); 
arLoadData('Bachmann_RS33_DR003', 1); 
arLoadData('Bachmann_RS33_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS33__Final', false, true); 

