% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS27 
% Random seed:		0001927000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS27'); 

% Load the time-course data 
arLoadData('Bachmann_RS27_TC001', 1); 
arLoadData('Bachmann_RS27_TC002', 1); 
arLoadData('Bachmann_RS27_TC003', 1); 
arLoadData('Bachmann_RS27_TC004', 1); 
arLoadData('Bachmann_RS27_TC005', 1); 
arLoadData('Bachmann_RS27_TC006', 1); 
arLoadData('Bachmann_RS27_TC007', 1); 
arLoadData('Bachmann_RS27_TC008', 1); 
arLoadData('Bachmann_RS27_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS27_DR001', 1); 
arLoadData('Bachmann_RS27_DR002', 1); 
arLoadData('Bachmann_RS27_DR003', 1); 
arLoadData('Bachmann_RS27_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS27__Final', false, true); 

