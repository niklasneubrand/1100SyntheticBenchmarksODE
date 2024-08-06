function arPlotXTrajectories()

global ar

% simulate model on fine grid
arSimu(0,1,1);


global ar

% Plot the trajectories of the Time Courses (using d2d functions)
ar.model.qPlotXs = [ar.model.plot(:).doseresponse]==0;
ar.model.qPlotX(:) = 1;
arPlotX();

% Plot the trajectories of the Dose Responses (workaround)
arPlotXTrajectoriesDR();


end