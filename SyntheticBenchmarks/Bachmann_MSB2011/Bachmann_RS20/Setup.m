% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS20 
% Random seed:		0001920000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS20'); 

% Load the time-course data 
arLoadData('Bachmann_RS20_TC001', 1); 
arLoadData('Bachmann_RS20_TC002', 1); 
arLoadData('Bachmann_RS20_TC003', 1); 
arLoadData('Bachmann_RS20_TC004', 1); 
arLoadData('Bachmann_RS20_TC005', 1); 
arLoadData('Bachmann_RS20_TC006', 1); 
arLoadData('Bachmann_RS20_TC007', 1); 
arLoadData('Bachmann_RS20_TC008', 1); 
arLoadData('Bachmann_RS20_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS20_DR001', 1); 
arLoadData('Bachmann_RS20_DR002', 1); 
arLoadData('Bachmann_RS20_DR003', 1); 
arLoadData('Bachmann_RS20_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS20__Final', false, true); 

