function arNewRealisticDesign(loadPattern, qSetConds, qSetPars, qSetTime, qSetData, randomSeed)

% TODO:
% - create arRealisticConds (optional)
% - improve arRealisticTimesRTF (optional)
% - use switches instead of booleans for qSet*, e.g.
%   'default', 'simulate', name of a file to load

arguments
    loadPattern (1,1) string = "Basis"
    qSetConds (1,1) logical = false
    qSetPars (1,1) logical = true
    qSetTime (1,1) logical = true
    qSetData (1,1) logical = true
    randomSeed (1,:) = 'shuffle'
end

global ar

%% Load benchmark model
modelLoaded = arLoadLatest(loadPattern);
if ~modelLoaded
    error('No Model found. Did you compile one?\n')
end


%% Set Conditions/Observables
% currently use conds and obs from the actual ar struct
if qSetConds
    % arRealisticConds();  % TODO: create
else
    % use the observables from the loaded model
end


%% Modify the model parameters and bounds
if qSetPars
    ar.pBestOriginal = ar.p;
    % multiply parameters by random factor in [1/2, 2]
    newParams = arRealisticParams(2, 'log-uniform', randomSeed);
    ar.p = newParams;
    arFprintf(1, 'Parameters randomized realistically.\n')
    % TODO: could be more realistic by considering the kind of parameter
else
    % use the parameters from the loaded model
end
% set bounds to +-3 orders of magnitude around the parameters
arSetParsBounds(3);


%% Use RTF fits to set realistic time points

if qSetTime
    arRealisticTimesRTF(randomSeed);
else
    % use the time points from the loaded model
end

%% Simulate realistic data
if qSetData
    arRealisticData(randomSeed);
else
    % use the data from the loaded model
end

end