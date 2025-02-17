% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS45 
% Random seed:		0001945000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS45'); 

% Load the time-course data 
arLoadData('Bachmann_RS45_TC001', 1); 
arLoadData('Bachmann_RS45_TC002', 1); 
arLoadData('Bachmann_RS45_TC003', 1); 
arLoadData('Bachmann_RS45_TC004', 1); 
arLoadData('Bachmann_RS45_TC005', 1); 
arLoadData('Bachmann_RS45_TC006', 1); 
arLoadData('Bachmann_RS45_TC007', 1); 
arLoadData('Bachmann_RS45_TC008', 1); 
arLoadData('Bachmann_RS45_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS45_DR001', 1); 
arLoadData('Bachmann_RS45_DR002', 1); 
arLoadData('Bachmann_RS45_DR003', 1); 
arLoadData('Bachmann_RS45_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS45__Final', false, true); 

