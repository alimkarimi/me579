function [xt, t] = mytimehistory(fk,Ck, T, Np, t0)
%{
4-c: Write a MATLAB function that has input vectors fk and Ck and generates N p periods of the time
history of the signal sampled at 20 times the highest frequency in the frequency vector, starting
from t0 seconds. The input vectors need only include values when Ck is non zero, but in this case,
for simplicity, you will need to have the period or the fundamental frequency as an additional
input.
%}


fs = 20 * max(fk); %if max fs is 60, then fs is 60 * 20, for example
Npts = Np * T * fs; %number of points to sample are Npts. If T = .05s, fs = 1200, and Np, then Npts = 4 * .05 * 1200
% or 240  (in this case). We end up taking a sample at 240 points along the data, from 0s to 2.0 s in 240 increments

%t0 = 0; %starting time is 0

t = t0 + (0:(Npts - 1))/fs;

xt = Ck(1) + zeros(1, length(t));
for k = 1:length(Ck) - 1
    xt = xt + 2 * real(Ck(k+1) * exp(1i * 2 * pi * (k / T) * t));
end

end

