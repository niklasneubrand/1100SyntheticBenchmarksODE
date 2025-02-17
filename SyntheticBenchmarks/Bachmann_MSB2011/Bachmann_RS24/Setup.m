% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS24 
% Random seed:		0001924000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS24'); 

% Load the time-course data 
arLoadData('Bachmann_RS24_TC001', 1); 
arLoadData('Bachmann_RS24_TC002', 1); 
arLoadData('Bachmann_RS24_TC003', 1); 
arLoadData('Bachmann_RS24_TC004', 1); 
arLoadData('Bachmann_RS24_TC005', 1); 
arLoadData('Bachmann_RS24_TC006', 1); 
arLoadData('Bachmann_RS24_TC007', 1); 
arLoadData('Bachmann_RS24_TC008', 1); 
arLoadData('Bachmann_RS24_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS24_DR001', 1); 
arLoadData('Bachmann_RS24_DR002', 1); 
arLoadData('Bachmann_RS24_DR003', 1); 
arLoadData('Bachmann_RS24_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS24__Final', false, true); 

