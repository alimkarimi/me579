%HW 5 PROBLEM 1B

fs = 1024;
R = 0.995;
b = [0.5 + 0.5*R^2, 0, 0.5+ 0.5*(R^2)];
a = [1, 0, R^2];
x = [1, zeros(1,99)]; %delta function at n = 0, 0 everywhere else
delta = 1/fs;

IIR_first100 = filter(b, a, x); %first 100 points - gets really small.

t = 0: delta : 100 * delta - delta;

plot(t, IIR_first100)
title("IIR First 100 Points")
xlabel("Time - sec")
ylabel("Response")


