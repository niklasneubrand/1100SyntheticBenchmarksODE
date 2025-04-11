% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS42 
% Random seed:		0001942000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS42'); 

% Load the time-course data 
arLoadData('Bachmann_RS42_TC001', 1); 
arLoadData('Bachmann_RS42_TC002', 1); 
arLoadData('Bachmann_RS42_TC003', 1); 
arLoadData('Bachmann_RS42_TC004', 1); 
arLoadData('Bachmann_RS42_TC005', 1); 
arLoadData('Bachmann_RS42_TC006', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS42_DR001', 1); 
arLoadData('Bachmann_RS42_DR002', 1); 
arLoadData('Bachmann_RS42_DR003', 1); 
arLoadData('Bachmann_RS42_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS42__Final', false, true); 

