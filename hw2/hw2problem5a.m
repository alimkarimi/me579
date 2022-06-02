% HW 2 - PROBLEM 5a

%For fm = 2 Hz and ?=0.5, calculate the instantaneous frequency (in Hz). Plot 1 second of y(t)
%and the instantaneous frequency, f(t). For these plots sample y(t) and f(t) at 10 times the highest
%value of the instantaneous frequency

%First, plot the instantaeous frequency: f(t) = 50 - 25*sin(4pit) Hz
%10 times the highest frequency should be sampling at once every 0.1
%seconds
t = 0:.0001:1;
ft = 50 - 25*sin(4* pi * t);
subplot(2,1,1)
plot(t,ft)
xlabel("Time - seconds")
ylabel("Instantaneous Frequency - Hz")
title("Instantaneous Frequency over Time")


%Second, plot y(t) = 10 * sin(2*pi*t + 12.5 * cos(4 * pi * t)) Volts

yt = 10 * sin(2*pi*50*t + 12.5 * cos(4 * pi * t));
subplot(2,1,2)
plot(t, yt)
xlabel("Time - seconds")
ylabel("Frequency Modulated Signal - Volts")
title("Frequency Modulated Signal over Time")