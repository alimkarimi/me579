%HW 4 - PROBLEM 4-A

%  In a program, generate two signals of length 0.5 seconds 
%  sampling at 128 samples per seecond: %x(t) = 10sin(2?30t), 
%  and y(t) = 10sin(180t).
%  

fs = 128;
delta = 1/fs;
t = 0:delta:(0.5-delta);

xt = 10*sin(2*pi*30*t);
yt = 10*sin(180*t);