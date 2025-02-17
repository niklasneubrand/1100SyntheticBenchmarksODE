% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS49 
% Random seed:		0001949000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS49'); 

% Load the time-course data 
arLoadData('Bachmann_RS49_TC001', 1); 
arLoadData('Bachmann_RS49_TC002', 1); 
arLoadData('Bachmann_RS49_TC003', 1); 
arLoadData('Bachmann_RS49_TC004', 1); 
arLoadData('Bachmann_RS49_TC005', 1); 
arLoadData('Bachmann_RS49_TC006', 1); 
arLoadData('Bachmann_RS49_TC007', 1); 
arLoadData('Bachmann_RS49_TC008', 1); 
arLoadData('Bachmann_RS49_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS49_DR001', 1); 
arLoadData('Bachmann_RS49_DR002', 1); 
arLoadData('Bachmann_RS49_DR003', 1); 
arLoadData('Bachmann_RS49_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS49__Final', false, true); 

