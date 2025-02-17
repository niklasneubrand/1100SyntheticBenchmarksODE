% Setup File For Realistic Simulation
% Original project:	Bachmann_MSB2011 
% RS project name:	Bachmann_RS44 
% Random seed:		0001944000 

% Initialize the d2d toolbox 
arInit();

% Load the models 
arLoadModel('Bachmann_RS44'); 

% Load the time-course data 
arLoadData('Bachmann_RS44_TC001', 1); 
arLoadData('Bachmann_RS44_TC002', 1); 
arLoadData('Bachmann_RS44_TC003', 1); 
arLoadData('Bachmann_RS44_TC004', 1); 
arLoadData('Bachmann_RS44_TC005', 1); 
arLoadData('Bachmann_RS44_TC006', 1); 
arLoadData('Bachmann_RS44_TC007', 1); 
arLoadData('Bachmann_RS44_TC008', 1); 
arLoadData('Bachmann_RS44_TC009', 1); 

% Load the dose-response data 
arLoadData('Bachmann_RS44_DR001', 1); 
arLoadData('Bachmann_RS44_DR002', 1); 
arLoadData('Bachmann_RS44_DR003', 1); 
arLoadData('Bachmann_RS44_DR004', 1); 

% Compile the project 
arCompileAll(); 

% Save the project 
arSave('Bachmann_RS44__Final', false, true); 

