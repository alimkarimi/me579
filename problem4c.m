%{
Write a MATLAB function that has input vectors fk and Ck and generates N p periods of the time
history of the signal sampled at 20 times the highest frequency in the frequency vector, starting
from t0 seconds. The input vectors need only include values when Ck is non zero, but in this case,
for simplicity, you will need to have the period or the fundamental frequency as an additional
input.

Function was created in mytimehistory.m

Will be referring to that function in this script.

%}

%From HW1, Problem 4-1 and 4-2 and parameters specified in part problem 4d:

i = 1*i;
k = 0:5;
fk = k * 100;
Ck = [-2 + 0*i, 0, 2*sqrt(2) - 2*i * sqrt(2), -5 + 0*i, 0, 0 + 7*i]; %derived from plots in hw problem
Tp = .01; % 1 / fk(2)
f1 = 100; %the second element of fk
t0 = -1; %time starts at -1second, per problem
Np = 5; %plot 5 periods, per problem



[xt, t] = mytimehistory(fk, Ck, Tp, Np, t0);

plot(t, xt)
xlabel("Time - Seconds")
ylabel("Est. x(t) - V")
title("Est Time History")