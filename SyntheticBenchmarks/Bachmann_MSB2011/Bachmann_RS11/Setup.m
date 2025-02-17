% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS11 
% Random seed:		0001911000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS11'); 

% Load the time-course data 
arLoadData('Bachmann_RS11_TC001', 1); 
arLoadData('Bachmann_RS11_TC002', 1); 
arLoadData('Bachmann_RS11_TC003', 1); 
arLoadData('Bachmann_RS11_TC004', 1); 
arLoadData('Bachmann_RS11_TC005', 1); 
arLoadData('Bachmann_RS11_TC006', 1); 
arLoadData('Bachmann_RS11_TC007', 1); 
arLoadData('Bachmann_RS11_TC008', 1); 
arLoadData('Bachmann_RS11_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS11_DR001', 1); 
arLoadData('Bachmann_RS11_DR002', 1); 
arLoadData('Bachmann_RS11_DR003', 1); 
arLoadData('Bachmann_RS11_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS11__Final', false, true); 

