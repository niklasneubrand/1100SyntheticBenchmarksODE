function newParams = arRealisticParams(amplitude, distribution, randomSeed)
% ARREALISTICPARAMS sets the parameters to realistic values
%
%  Description:
%   * The original parameters are multiplied with a random factor.
%   * If the parameters are exactly zero, they remain unchanged.
%   * Error parameters are not modified.
%
%
%  Inputs:
%    amplitude      factor for the randomization of the parameters
%                   (default: 2)
%    distribution   'log-uniform' or 'log-normal'
%                   (default: 'log-uniform')
%    randomSeed     seed for the random number generator
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
    randomSeed (1,:) = 'shuffle'
end

global ar %#ok<*GVMIS>

%% draw random factors from the specified distribution
rng(randomSeed)
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
% The double negation ~~ is used as a shortcut to convert
% integers to logicals: ~~0 == false, ~~1 == true


newParams = ar.p;

% apply factors to log10 and linear parameters
newParams(~~ar.qLog10) = newParams(~~ar.qLog10) + log10(factors(~~ar.qLog10));
newParams(~ar.qLog10) = newParams(~ar.qLog10) .* factors(~ar.qLog10);

% do not modify vanishing parameters
newParams(~ar.qLog10 & ar.p==0) = 0;

% do not modify error parameters
newParams(~~ar.qError) = ar.p(~~ar.qError);

% only modify fitted parameters
newParams(~ar.qFit) = ar.p(~ar.qFit);

end
