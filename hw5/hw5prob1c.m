%HW 5 PROBLEM 1-C

%Use the fft command twice to determine the frequency response of the
%filter at 4097 points from 0 to half fs. 

%  Will need to zero pad by at least 2^q = 2^13, as that is the q that
%  makes the signal at least 4,097 points. 2^12 is 4,096, so we won't get
%  the 4,097th point EFFICIENTLY unless we zero pad to 2^13.

R = 0.995; %copy variable from 1-B
b = [0.5 + 0.5*(R^2), 0, 0.5+ 0.5*(R^2)]; %copy vector from 1-B
a = [1, 0, R^2]; %copy vector from 1-B
fs = 1024;

N = 2^13;

Gsf = fft(b, N) ./ fft(a, N);


k = 1:N;
f = k * (fs/N);
subplot(2,1,1)
plot(f, abs(Gsf))
xlabel("Frequency - Hz")
ylabel("Magnitude")
title("Magnitude of Gs(f)")
xlim([0 fs/2])

subplot(2,1,2)
plot(f, angle(Gsf))
title("Phase of Gs(f)")
xlabel("Frequency - Hz")
ylabel("Radians")
xlim([0 fs/2])




