function [simuSuccess, configSuccess, errReport] = arSimuMultiTries(sensi, fine, dynamics, options)

arguments
    sensi (1,:) logical = true              % by default: true
    fine (1,:) logical = [true, false]      % by default: simulate boths
    dynamics (1,:) logical = true           % by default: simulate dynamics
    options.nCVRestart (1,1) double         % by default: use value from ar.config (if not set, use 10)
    options.tolFactor (1,1) double = 2      % by default: increase tolerances by factor of 2
    options.stepsFactor (1,1) double = 2    % by default: increase maxsteps by 20%
end

global ar

%% remember the original settings
configOld = struct();
configOld.atol = ar.config.atol;
configOld.rtol = ar.config.rtol;
configOld.atolV = ar.config.atolV;
configOld.atolV_Sens = ar.config.atolV_Sens;
configOld.maxsteps = ar.config.maxsteps;
qPositiveX = {ar.model(:).qPositiveX};


%% set options for heuristic methods
if isfield(options, 'nCVRestart')
    nCVRestart = options.nCVRestart;
elseif isfield(ar.config, 'nCVRestart') || ~isnan(ar.config.nCVRestart)
    nCVRestart = ar.config.nCVRestart;
else
    nCVRestart = 10;
end


% flags for heuristic methods
allowNegativeX = 0;
toggleVectorTols = 0;


%% try to simulate the model (multiple times)
for iTry = 1:nCVRestart
    
    try
        % try to simulate the model
        for iFine = 1:length(fine)
            arSimu(sensi, fine(iFine), dynamics);
        end
        % if no error occurred, exit the loop
        simuSuccess = true;
        break
        
    catch ME
        % there was a simulation error!
        simuSuccess = false;
        arFprintf(1, 'Integration error.\n');
        disp(ME.message);

        % Break the loop if the error is not fixable
        % undefined function -> break
        if strcmp(ME.identifier,'MATLAB:UndefinedFunction')
            break
        end
        % no typical CVODES error flag -> unknown source -> break
        for m=1:length(ar.model)
            if all([ar.model(m).condition(:).status] >= 0)
                break
            end
        end
        
        % heuristic methods to fix the error and try again
        if iTry < nCVRestart
            
            increaseMaxsteps = 0;
            increaseTols = 0;
            
            for m=1:length(ar.model)
                % CV_TOO_MUCH_WORK
                if any([ar.model(m).condition(:).status] == -1)
                    if any(ar.model(m).qPositiveX(:))
                        % some states have to positive?
                        % -> temporarily allow negative states
                        ar.model(m).qPositiveX(:) = 0;
                        allowNegativeX = 1;
                    else
                        % no positivity restraints?
                        % -> increase max number of steps
                        increaseMaxsteps = 1;
                    end
                end
                % other CVODES error, e.g., -2 = CV_TOO_MUCH_ACC (to much accuracy)
                if any([ar.model(m).condition(:).status] < -1)
                    if toggleVectorTols == 0
                        % try other vector tolerance settings
                        % (if problem persists, switch back to original settings)
                        ar.config.atolV = ~ar.config.atolV;
                        ar.config.atolV_Sens = ~ar.config.atolV_Sens;
                        toggleVectorTols = 1;
                    elseif toggleVectorTols == 1
                        % switch back to original settings
                        ar.config.atolV = atolV;
                        ar.config.atolV_Sens = atolV_Sens;
                        toggleVectorTols = 2;
                        % instead: loosen tolerances
                        increaseTols = 1;
                    end
                end
                
            end
            
            % console output
            arFprintf(1, 'New Attempt (%d/%d).\n', iTry+1, nCVRestart)
            if allowNegativeX
                arFprintf(1, 'Allow negative states.\n')
                allowNegativeX = 0;  % only show console output once
            end
            if toggleVectorTols == 1
                arFprintf(1, 'Switch vector tolerance setting.\n')
            elseif toggleVectorTols == 2
                arFprintf(1, 'Switch back to original vector tolerance setting.\n')
            end
            if increaseMaxsteps
                % why 20%?
                ar.config.maxsteps = options.stepsFactor*ar.config.maxsteps;
                arFprintf(1, 'Increase maxsteps by factor %3.2f (now: %0.2e).\n', ...
                    options.stepsFactor, ar.config.maxsteps)
            end
            if increaseTols
                % why 5%?
                ar.config.atol = options.tolFactor*ar.config.atol;
                ar.config.rtol = options.tolFactor*ar.config.rtol;
                arFprintf(1, 'Increase tolerances by factor %3.2f (now: atol=%0.2e, rtol=%0.2e).\n', ...
                    options.tolFactor, ar.config.atol, ar.config.rtol)
            end
            
        end
    end
end

% return the successful configurations
configSuccess = struct();
if simuSuccess && iTry > 1
    configs = fieldnames(configOld);
    for i = 1:length(configs)
        if configOld.(configs{i}) ~= ar.config.(configs{i})
            configSuccess.(configs{i}) = ar.config.(configs{i});
        end
    end
end

% reset parameters to original values
ar.config.atol = configOld.atol;
ar.config.rtol = configOld.rtol;
ar.config.atolV = configOld.atolV;
ar.config.atolV_Sens = configOld.atolV_Sens;
ar.config.maxsteps = configOld.maxsteps;
for m=1:length(ar.model)
    ar.model(m).qPositiveX = qPositiveX{m};
end

% return error message if simulation was not successful
if ~simuSuccess
    errReport = getReport(ME, 'extended', 'hyperlinks', 'off');
else
    errReport = '';
end

end