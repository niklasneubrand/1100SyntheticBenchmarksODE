% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS06 
% Random seed:		0001906000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS06'); 

% Load the time-course data 
arLoadData('Bachmann_RS06_TC001', 1); 
arLoadData('Bachmann_RS06_TC002', 1); 
arLoadData('Bachmann_RS06_TC003', 1); 
arLoadData('Bachmann_RS06_TC004', 1); 
arLoadData('Bachmann_RS06_TC005', 1); 
arLoadData('Bachmann_RS06_TC006', 1); 
arLoadData('Bachmann_RS06_TC007', 1); 
arLoadData('Bachmann_RS06_TC008', 1); 
arLoadData('Bachmann_RS06_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS06_DR001', 1); 
arLoadData('Bachmann_RS06_DR002', 1); 
arLoadData('Bachmann_RS06_DR003', 1); 
arLoadData('Bachmann_RS06_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS06__Final', false, true); 

