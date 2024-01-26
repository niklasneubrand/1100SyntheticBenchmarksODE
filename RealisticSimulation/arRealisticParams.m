function newParams = arRealisticParams(amplitude, distribution, rngSeed)
% ARREALISTICPARAMS  sets the dynamic parameters to realistic values
%
%  Description:
%   * The original parameters are multiplied with a random factor.
%   * If the parameters are exactly zero, they remain unchanged.
%   * Only the dynamic, i.e. model-related, parameters are modified.
%
%
%  Inputs:
%    amplitude      factor for the randomization of the parameters
%                   (default: 2)
%    distribution   'log-uniform' or 'log-normal'
%                   (default: 'log-uniform')
%    rngSeed     seed for the random number generator
%                   (default: 'shuffle', i.e., based on the current time)
%
%  Interpretation of distributions:
%    log-uniform    factor is log-uniformly distributed between 1/amplitude and amplitude
%                   i.e., exponent is uniformly distr. between -log10(amplitude) and log10(amplitude)
%    log-normal     factor is log-normally distributed. Mean 1, 68% of values between 1/amplitude and amplitude
%                   i.e., exponent is normally distr. with mean 0 and std log10(amplitude)
%  Outputs:
%    newParams      new parameters
% 

arguments
    amplitude (1,1) double = 2
    distribution (1,:) char = 'log-uniform'
    rngSeed (1,:) = 'shuffle'
end

global ar %#ok<*GVMIS>

%% draw random factors from the specified distribution
rng(rngSeed)
switch distribution
    case 'log-uniform'
        factors = amplitude.^(1 - 2*rand(1, length(ar.p)));
    case 'log-normal'
        factors = amplitude.^(randn(1, length(ar.p)));
    otherwise
        error('Unknown distribution: %s.', distribution)
end


%% calculate new parameters
% NOTE:
% The double negation logical( is used as a shortcut to convert
% integers to logicals: logical(0 == false, logical(1 == true


newParams = ar.p;

% apply factors to log10 and linear parameters
newParams(logical(ar.qLog10)) = newParams(logical(ar.qLog10)) + log10(factors(logical(ar.qLog10)));
newParams(~ar.qLog10) = newParams(~ar.qLog10) .* factors(~ar.qLog10);

% do not modify vanishing parameters
newParams(~ar.qLog10 & ar.p==0) = 0;

% only modify dynamic parameters
newParams(~ar.qDynamic) = ar.p(~ar.qDynamic);

% only modify fitted parameters
newParams(~ar.qFit) = ar.p(~ar.qFit);

end
