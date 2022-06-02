%HW PROBLEM 1-C 
%TEST OUT mydisconv.m ON PARAMETERS IN PROBLEM 1-A

xn = zeros(1, 10) + 10;
origlengthxn = length(xn);

hn = zeros(1,5) + 5;
origlengthhn = length(hn);

hn = [hn, zeros(1,origlengthxn -1)];
xn = [xn, zeros(1,origlengthhn -1)];

xstart = 0;
fs = 0.5;
hstart = -2/fs;

[yn, ty] = mydisconv(xn, hn, fs, xstart, hstart);
subplot(2,1,1)
stem(ty, yn)
title("Convolution using mydisconv.m")
xlabel("Time in sec")
ylabel("Output")


%comparing to built in conv program:
subplot(2,1,2)
resultofMatlabConv = (1/fs)*conv(xn, hn);
stem(ty, resultofMatlabConv) %reuse time vector from mydisconv.m
title("Convolution using built in conv() function")
xlabel("Time in sec")
ylabel("Output")



