% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS31 
% Random seed:		0001931000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS31'); 

% Load the time-course data 
arLoadData('Bachmann_RS31_TC001', 1); 
arLoadData('Bachmann_RS31_TC002', 1); 
arLoadData('Bachmann_RS31_TC003', 1); 
arLoadData('Bachmann_RS31_TC004', 1); 
arLoadData('Bachmann_RS31_TC005', 1); 
arLoadData('Bachmann_RS31_TC006', 1); 
arLoadData('Bachmann_RS31_TC007', 1); 
arLoadData('Bachmann_RS31_TC008', 1); 
arLoadData('Bachmann_RS31_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS31_DR001', 1); 
arLoadData('Bachmann_RS31_DR002', 1); 
arLoadData('Bachmann_RS31_DR003', 1); 
arLoadData('Bachmann_RS31_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS31__Final', false, true); 

