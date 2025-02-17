% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS41 
% Random seed:		0001941000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS41'); 

% Load the time-course data 
arLoadData('Bachmann_RS41_TC001', 1); 
arLoadData('Bachmann_RS41_TC002', 1); 
arLoadData('Bachmann_RS41_TC003', 1); 
arLoadData('Bachmann_RS41_TC004', 1); 
arLoadData('Bachmann_RS41_TC005', 1); 
arLoadData('Bachmann_RS41_TC006', 1); 
arLoadData('Bachmann_RS41_TC007', 1); 
arLoadData('Bachmann_RS41_TC008', 1); 
arLoadData('Bachmann_RS41_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS41_DR001', 1); 
arLoadData('Bachmann_RS41_DR002', 1); 
arLoadData('Bachmann_RS41_DR003', 1); 
arLoadData('Bachmann_RS41_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS41__Final', false, true); 

