%HW 3 - Problem 3-E

%Write a program to test out your function. Input time history is a sine
%wave wth amplitude 3, frequency 2403, sampled at fs = 2048 samples per
%second. Sampled for 1 second. 

fs = 2048;
N = 2048;
delta = 1/fs;
t = delta*(0:N-1);
xn = 3*sin(2403 * t);


plot(t, xn);

%HANN WINDOW
[Sxxf, fk] = mypsd(xn, N, fs, 1); %1 in argument means Hann Window, 2 means Rectangular window. 

subplot(2,2,1)
plot(fk, Sxxf(1:length(fk)))
title("Power Spectral Density - Hann Window")
xlabel("Frequency")
ylabel("Volts / Hz")

fpeak = find(Sxxf == max(Sxxf(1:length(fk))));

for x = 1:30
    power_est_vector(x) = mypowerest(fk, Sxxf, fpeak, x);
    M(x) = x;
end
subplot(2,2,2)
plot(M, power_est_vector)
title("Numboer of terms around peak to integrate to get 99% of actual Power using Hann Window")
xlabel("Number of terms - + and - around peak")
ylabel("Power Estimate - Volts")
hold on
plot(M, zeros(1,length(M)) + 0.99*4.5)
hold off

%RECTANGULAR WINDOW
[Sxxf, fk] = mypsd(xn, N, fs, 2); %2 in argument means Rectangular Window.

subplot(2,2,3)
plot(fk, Sxxf(1:length(fk)))
title("Power Spectral Density - Rectangular Window")
xlabel("Frequency")
ylabel("Volts / Hz")
fpeak = find(Sxxf == max(Sxxf(1:length(fk))));

for x = 1:30
    power_est_vector(x) = mypowerest(fk, Sxxf, fpeak, x);
    M(x) = x;
end

subplot(2,2,4)
plot(M, power_est_vector)
title("Numboer of terms around peak to integrate to get 99% of actual Power using Rect Window")
xlabel("Number of terms - + and - around peak")
ylabel("Power Estimate - Volts")
hold on
plot(M, zeros(1,length(M)) + 0.99*4.5)
hold off