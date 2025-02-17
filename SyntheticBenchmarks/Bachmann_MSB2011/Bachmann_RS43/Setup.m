% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS43 
% Random seed:		0001943000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS43'); 

% Load the time-course data 
arLoadData('Bachmann_RS43_TC001', 1); 
arLoadData('Bachmann_RS43_TC002', 1); 
arLoadData('Bachmann_RS43_TC003', 1); 
arLoadData('Bachmann_RS43_TC004', 1); 
arLoadData('Bachmann_RS43_TC005', 1); 
arLoadData('Bachmann_RS43_TC006', 1); 
arLoadData('Bachmann_RS43_TC007', 1); 
arLoadData('Bachmann_RS43_TC008', 1); 
arLoadData('Bachmann_RS43_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS43_DR001', 1); 
arLoadData('Bachmann_RS43_DR002', 1); 
arLoadData('Bachmann_RS43_DR003', 1); 
arLoadData('Bachmann_RS43_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS43__Final', false, true); 

