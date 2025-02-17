% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS25 
% Random seed:		0001925000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS25'); 

% Load the time-course data 
arLoadData('Bachmann_RS25_TC001', 1); 
arLoadData('Bachmann_RS25_TC002', 1); 
arLoadData('Bachmann_RS25_TC003', 1); 
arLoadData('Bachmann_RS25_TC004', 1); 
arLoadData('Bachmann_RS25_TC005', 1); 
arLoadData('Bachmann_RS25_TC006', 1); 
arLoadData('Bachmann_RS25_TC007', 1); 
arLoadData('Bachmann_RS25_TC008', 1); 
arLoadData('Bachmann_RS25_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS25_DR001', 1); 
arLoadData('Bachmann_RS25_DR002', 1); 
arLoadData('Bachmann_RS25_DR003', 1); 
arLoadData('Bachmann_RS25_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS25__Final', false, true); 

