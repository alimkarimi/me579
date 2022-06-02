%              PROBLEM 4c
%All components of W(f) are real, so magnitude is just the abs value of
%each component. 

T = 1; %Per Yongjie, assume T = 1 
f = 0:0.1:100; %10 points between 0 crossings
W = zeros(1,length(f)); %set Fourier transform of w(t) to W with all zeros for now. 
W(1) = abs((T/2)^2); %double check %sinc function is just 1 when f = 0. For some reason,
%not able to get sinc() working on my version of MATLAB. 

%calculate magnitude
for x = 2:length(f)
    W(x) = ((T/2)^2* (sin(pi * f(x) * T/2)).^2) / ((pi * f(x) * (T/2)).^2); %double check
end

%convert to 20log10
W = 20*log10(abs(W)/W(1));

semilogx(f,W) %plot on semilogx axis. 
title("Amplitude Density Spectrum")
xlabel("Frequency - Hz")
ylabel("dB / Hz")
ylim([-80 0])
grid on

%Compare with Fourier transform of rectangular window:
R = zeros(1,length(f)); %set components of Fourier transform of rectangular window to zero

R(1) = T; % when f is 0, sinc function should be 1, so this is just T * 1, or T. 
for x = 2:length(f)
    R(x) = T * sin(T * pi * f(x)) / (T * pi * f(x));
end


R = 20*log10(abs(R)/R(1));
hold on
semilogx(f, R)

%FT of Hann window - uses R above. Given in problem:
H = zeros(1, length(f)); %set components of Fourier transform of Hann window to zero
%0.5*R(f)+ 0.25*R(f - 1/T) + 0.25*R(f + 1/T)
Rfminus1overT = zeros(1,length(f));
Rfplus1overT = zeros(1, length(f));

%re-run R, because it was overwritten with abs values:
R = zeros(1,length(f)); %set components of Fourier transform of rectangular window to zero

R(1) = T; % when f is 0, sinc function should be 1, so this is just T * 1, or T.

for x = 2:length(f)
    R(x) = T * sin(T * pi * f(x)) / (T * pi * f(x));
end

%done re-running R original

for x = 1:length(f)
    Rfminus1overT(x) = T * sin(T * pi * (f(x)-1)) / (T * pi * (f(x)-1));
    Rfplus1overT(x) = T * sin(T * pi * (f(x)+1)) / (T * pi * (f(x)+1));
end

Rfminus1overT(11) = T; %this element would be NaN


H = (0.5 * R) + (0.25 * Rfminus1overT) + (0.25 * Rfplus1overT);
H = 20*log10(abs(H)/abs(H(1)));
%something that calculates R(f-1/T) % * 0.25 * something that calculates R(f+1/T)
hold on
semilogx(f, H)
legend('W(f) - Triangle Window', 'R(f) - Rectangular Window', 'H(f) - Hann Window')

hold on
semilogx(f, zeros(size(f))-3) %create line in plot for amplitude = -3, so
%it is easy to see / visualize the bandwidth.


