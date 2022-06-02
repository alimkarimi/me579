%HW 3 - Problem 2i: 

%xn = A*exp(-alpha * delta * n) for n>= 0

%FT of the infinitely sampled signal is a geometric progression
%FT of signal sampled with N-terms is also a geometric progression:

%Xsf = P0 * (1 - P^N) / (1 - P), where

%P0 = A
%P = exp(-(alpha + (2 * pi * i * f) * delta 
%N = N % number of terms in sequence

alpha = 10;
A = 10; %volts 
fmax = 40;
fs = 1000;
delta = 1/fs;
t01 = 0:delta:(0.2 - delta);
t02 = 0:delta:(0.5 - delta);


xn1 = A*exp(-alpha * t01);
xn2 = A*exp(-alpha * t02);
%for n>= 0
%Part i: Plot truncated time history 0 to t0 seconds. Set y-axis from 0 to
%A
subplot(3,2,1)
plot(t01, xn1)
title("Time history of xn for 0.2 seconds")
xlabel("Time")
ylabel("Volts")
ylim([0 A])
xlim([0 max(t02)])


subplot(3,2,2)
plot(t02, xn2)
ylim([0 A])
xlim([0 max(t02)])
title("Time history of xn for 0.5 seconds")
xlabel("Time")
ylabel("Volts")

%Part ii: Plot the magnitude of Xsf after and before truncation (windowing)
%of the time history. 


%FT of signal sampled with N-terms after window for 0.2s --> can use the
%fft function in MATLAB
N1 = length(t01); %Number of samples in 0.2s
Xsf1 = fft(xn1,N1);
fk1 = zeros(1, N1);
for k = 1:N1
    fk1(k) = k * (fs/N1);
end



%FT of signal sampled with N-terms after window for 0.5 s --> use fft() in
%MATLAB
N2 = length(t02); %Number of samples in 0.5s
Xsf2 = fft(xn2);
fk2 = zeros(1, N2);
for k = 1:N2
    fk2(k) = k * (fs/N2);
end

P0 = A;
df = 0:0.01:40;
P = exp(-(alpha + i*2*pi*df)*delta);
P_to_N1 = exp(-(alpha + i*2*pi*df)*delta).^N1;

%plot the magnitude before truncation - use the geometric series as that is the only way
%to plot an infinite (i.e not discrete) signal:
Xsf_geo_no_truncation = P0 ./ (1 - P);


%alternatively, we know that A * (1-(exp(-alpha + i * 2*pi*f))^N) / 1 -
%exp(-alpha + i * 2*pi*f) should also give us the FT: Check:



Xsf1_geo =  P0 * (1 - P_to_N1) ./ (1 - P);
subplot(3,2,3)
plot(df, abs(Xsf1_geo))
title("Magnitude Spectrum Xs(f) for xn sampled over 0.2s - using geometric progression")
xlabel("Frequency - Hz")
ylabel("Magnitude |Xs(f)| in V")
hold on
plot(df, abs(Xsf_geo_no_truncation))
hold off

P_to_N2 = exp(-(alpha + i*2*pi*df)*delta).^N2;
Xsf2_geo = P0 * (1 - P_to_N2) ./ (1 - P);
subplot(3,2,4)
plot(df, abs(Xsf2_geo))
title("Magnitude Spectrum Xs(f) for xn sampled over 0.5s - using geometric progression")
xlabel("Frequency - Hz")
ylabel("Magnitude |Xs(f)| in V")
hold on
plot(df, abs(Xsf_geo_no_truncation))
hold off

%Plot error:
%error before and after truncation on plot 0.2s window
subplot(3,2,5)
error1 = abs(Xsf_geo_no_truncation) - abs(Xsf1_geo);
plot(df, error1)
xlabel("Frequency - Hz")
ylabel("Error in Magnitude |Xs(f)| in V")
title("Error between magnitude in V over freq - windowing 0.2 vs no window")


subplot(3,2,6)
error2 = abs(Xsf_geo_no_truncation) - abs(Xsf2_geo);
plot(df, error2)
title("Error between magnitude in V over freq - windowing 0.5 vs no window")
xlabel("Frequency - Hz")
ylabel("Error in Magnitude |Xs(f)| in V")




