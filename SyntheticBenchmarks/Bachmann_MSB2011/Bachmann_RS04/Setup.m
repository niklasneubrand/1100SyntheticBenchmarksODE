% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS04 
% Random seed:		0001904000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS04'); 

% Load the time-course data 
arLoadData('Bachmann_RS04_TC001', 1); 
arLoadData('Bachmann_RS04_TC002', 1); 
arLoadData('Bachmann_RS04_TC003', 1); 
arLoadData('Bachmann_RS04_TC004', 1); 
arLoadData('Bachmann_RS04_TC005', 1); 
arLoadData('Bachmann_RS04_TC006', 1); 
arLoadData('Bachmann_RS04_TC007', 1); 
arLoadData('Bachmann_RS04_TC008', 1); 
arLoadData('Bachmann_RS04_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS04_DR001', 1); 
arLoadData('Bachmann_RS04_DR002', 1); 
arLoadData('Bachmann_RS04_DR003', 1); 
arLoadData('Bachmann_RS04_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS04__Final', false, true); 

