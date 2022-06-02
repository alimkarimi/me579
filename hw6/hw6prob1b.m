% HW 6 - Problem 1-b

% Use filter from HW6 1-a to calculate the derivative of x(t) = 5 * sin(2 *
% pi * 100 * t) + 5 * sin(2 * pi * 925 * t), sampled at 0.5 seconds at fs =
% 2048. Use your convolution function to multiply in frequency. 

% Result should be close to yp(t) = 1000 * pi * cos(2 * pi * 100 * t)

fs = 2048;
delta = 1/fs;
t_xn = 0: delta : 0.5 ; %sample at fs for half second. 
xn = (5 * sin(2 * pi * 100 * t_xn)) + (5 * sin(2 * pi * 925 * t_xn)); %this is the conv input.


%re-use variable "gn" from 1-a - that is the filter impulse response

convlength = length(xn) + length(gn) - 1; %convolution length wil need to be input length + impulse length -1

convstart = t_xn(1) + t_gn(1); %start of convolution input start + impulse start

[yn_orig] = mydiscreteconv(xn, gn, fs, convlength, 1); %return convolution result in time (yn). 
%argument of 1 signifies that sampling is already included in gn

t_yn_orig = (0 : delta: length(yn_orig) * delta - delta) + convstart;

figure(2)
plot(t_yn_orig, yn_orig)
hold on



chop_off_len = 32;
yn = yn_orig(chop_off_len: (length(yn_orig) - chop_off_len)); %chop off 31 points of off beginning and end of conv

t_yn = (0: delta : length(yn) * delta -delta); %adjust start time of convolution by convstart

ypt = 1000 * pi * cos(2 * pi * 100 * t_yn); %expected result

figure(2)
plot(t_yn, yn)
hold on
%plot(t_xn, xn) %better to plot on a separate plot
plot(t_yn, ypt)
legend('conv result- not chopped','conv result - chopped', 'dx/dt of first term in x(t)')
xlabel("Time - seconds")
ylabel("Response")
hold off

