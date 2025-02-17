% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS34 
% Random seed:		0001934000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS34'); 

% Load the time-course data 
arLoadData('Bachmann_RS34_TC001', 1); 
arLoadData('Bachmann_RS34_TC002', 1); 
arLoadData('Bachmann_RS34_TC003', 1); 
arLoadData('Bachmann_RS34_TC004', 1); 
arLoadData('Bachmann_RS34_TC005', 1); 
arLoadData('Bachmann_RS34_TC006', 1); 
arLoadData('Bachmann_RS34_TC007', 1); 
arLoadData('Bachmann_RS34_TC008', 1); 
arLoadData('Bachmann_RS34_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS34_DR001', 1); 
arLoadData('Bachmann_RS34_DR002', 1); 
arLoadData('Bachmann_RS34_DR003', 1); 
arLoadData('Bachmann_RS34_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS34__Final', false, true); 

