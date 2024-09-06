function [newParams, factors] = arRandomRealisticParams(amplitude, distribution, rngSeed)
% ARRANDOMREALISTICPAREMS  sets the dynamic parameters to realistic values
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
%    rngSeed        seed for the random number generator
%                   (default: 'shuffle', i.e., based on the current time)
%
%  Interpretation of distributions:
%    log-uniform    factor is log-uniformly distributed between 1/amplitude and amplitude
%                   i.e., exponent is uniformly distr. between -log10(amplitude) and log10(amplitude)
%    log-normal     factor is log-normally distributed. Mean 1, 68% of values between 1/amplitude and amplitude
%                   i.e., exponent is normally distr. with mean 0 and std log10(amplitude)
%  Outputs:
%    newParams      new parameters
%    factors        factors used for the randomization
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
newParams = ar.p;

%% which parameters to modify
qRandomize = ar.qDynamic==1 & ar.qFit==1;           % dynamic and fitted
qRandomize = qRandomize & (ar.qLog10==1 | ar.p~=0); % not vanishing
factors(~qRandomize) = 1;

% apply factors to log10 and linear parameters
newParams(ar.qLog10==1) = newParams(ar.qLog10==1) + log10(factors(ar.qLog10==1));
newParams(ar.qLog10==0) = newParams(ar.qLog10==0) .* factors(ar.qLog10==0);

end
