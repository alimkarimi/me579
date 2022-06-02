%PROBLEM 1-D
fs = 100;
xn = zeros(1, 128) + 10;
origlengthxn = length(xn);

n = 30:1:93;
hn = 10*exp(-0.5 * (n - 30) * 1/fs);
origlengthhn = length(hn);

hn = [hn, zeros(1, origlengthxn - 1)];

xn = [xn, zeros(1, origlengthhn -1)];
    
xstart = -0.2;
hstart = 0.3;
[yn, ty] = mydisconv(xn, hn, fs, xstart, hstart);
plot(ty, yn, '-o')
title("Convolution result")
xlabel("Time - s")
ylabel("Response")
grid on;



