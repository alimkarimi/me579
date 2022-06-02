%HW 4 PROBLEM 2-B

fs = 256;
delta = 1/fs;
f0 = 50;
sig = 0.01;
A = 1;
T = 0.75;
t = 0: delta : (T - delta);
xt = A * exp(-sig *2*pi* f0 * t) .* sin(2*pi*sqrt(1-sig^2)*f0*t);
figure(1)
plot(t, xt)
title("Sampled Time History")
xlabel("Time - s")
ylabel("Volts")
hold on

%time vector for 8T 
t_8x = 0: delta : (T*8 - delta);

% resample signal to 8T with updated time vector
xt_8x = A * exp(-sig *2*pi* f0 * t_8x) .* sin(2*pi*sqrt(1-sig^2)*f0*t_8x);

plot(t_8x, xt_8x)

legend('xt - 0.75s', 'xt - 6s')

%first estimate - no zero padding, .75s
figure(2)
[fk, esd_est] = myesd_est(xt, fs, 1);
semilogy(fk, abs(esd_est))
xlim([0 128])
title("Spectrum for signal sampled 0.75s vs 6s - no zero pad vs zero padding")
xlabel("Frequency - Hz")
ylabel("Volts/Hz")
orient tall;
hold on

%second estimate - zero padding q = 8, .75s
[fk1, esd_est1] = myesd_est(xt, fs, 8);

semilogy(fk1, abs(esd_est1))
xlim([0 128])

%third estimate 8T = 6s and q = 1 (no zero padding)
[fk2, esd_est2] = myesd_est(xt_8x, fs, 1);
semilogy(fk2, abs(esd_est2))

%sample theoretical X(f) at fs/8T
f = fk2;
fd = sqrt(1 - sig^2) * f0;
Xf = (A/(2*pi)) * (fd ./ ((f0^2 - f.^2) + 1i*2 * sig * f0 * f)); %formula for continuous X(f)

semilogy(f, abs(Xf).^2)

legend('q = 1, T = 0.75', 'q = 8, T = 0.75', 'q = 1, T = 8T', 'continuous signal')

hold off

%zoomed in plot at 50Hz
figure(3)
semilogy(fk, abs(esd_est))
xlim([45 55])
hold on
semilogy(fk2, abs(esd_est2))
semilogy(fk1, abs(esd_est1))
semilogy(f, abs(Xf).^2)
title("Zoomed in Spectrum")
legend('q = 1, T = 0.75', 'q = 8, T = 0.75', 'q = 1, T = 8T', 'continuous signal')
xlabel("Frequency - Hz")
ylabel("Volts / Hz")
hold off


