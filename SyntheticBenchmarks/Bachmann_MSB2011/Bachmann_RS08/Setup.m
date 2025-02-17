% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS08 
% Random seed:		0001908000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS08'); 

% Load the time-course data 
arLoadData('Bachmann_RS08_TC001', 1); 
arLoadData('Bachmann_RS08_TC002', 1); 
arLoadData('Bachmann_RS08_TC003', 1); 
arLoadData('Bachmann_RS08_TC004', 1); 
arLoadData('Bachmann_RS08_TC005', 1); 
arLoadData('Bachmann_RS08_TC006', 1); 
arLoadData('Bachmann_RS08_TC007', 1); 
arLoadData('Bachmann_RS08_TC008', 1); 
arLoadData('Bachmann_RS08_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS08_DR001', 1); 
arLoadData('Bachmann_RS08_DR002', 1); 
arLoadData('Bachmann_RS08_DR003', 1); 
arLoadData('Bachmann_RS08_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS08__Final', false, true); 

