%HW 5 - PROBLEM 2-B

%Test out myImpulseResponseAnalysis.m with the following impulse response:

fs = 500; %Hz
A = 330; %Hz
B = 60; %Hz
delta = 1/fs;
M = 63;
t = -M*delta :delta :M*delta; %ask about matching up this and f vector

gn = delta*A*(sin(pi * A * t) ./ (pi * A * t)) .* sin(pi* B * t) ./ (pi * B * t);  
gn(M+1) = delta*A; %I don't have a sinc function in my MATLAB toolbox so manually making the value at t = 0 where sinc = 1. 


myImpulseResponseAnalysis(gn, t(1), fs);




