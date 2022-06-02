%HW 5 PROBLEM 1-D

%  Generate new input by sampling x(t) = 10sin(2?256t) + 10sin(2?10t) for 2
%  seconds with fs = 1024. Use filter() to generate the response of the
%  filter to this input. Plot the input and output signals on the same
%  plot. 

%copy problem parameters from previous problem
fs = 1024;
R = 0.995;
b = [0.5 + 0.5*(R^2), 0, 0.5+ 0.5*(R^2)];
a = [1, 0, R^2];

%sample x(t):

delta = 1/fs;

t = 0: delta : (2 - delta);

xt = 10 * sin(2*pi*256*t) + 10 * sin(2*pi*10*t);

response = filter(b, a, xt);

plot(t, xt)
hold on
plot(t, response)
legend('sampled signal', 'response')
hold off
title("Original Sampled Signal and Signal after passing through filter")
xlabel("Time - s")
ylabel("Signal Response")


