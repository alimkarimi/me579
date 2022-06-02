% HW 4 PROBLEM 5D

A = 1;
fs = 100;
a = 0.95;
N = 1024;
k = 0:1:N - 1;
f = k * (fs/N);


z = exp(1i*pi*2*f*(1/fs));

Xz = A .* (z.^32 - a^32) ./ (z.^32 .* (z - a));

for n = 1:N
    if n == 1
        xn(n) = 0;
    end
    if n >= 2 && n <= 33
        xn(n) = A * a^(n-1);
    end
    if n > 34
        xn(n) = 0;
    end
end

Xf = fft(xn);
subplot(2,1,1)
plot(f, abs(Xf))
xlim([0 50])
title("Magnitude of Xs(fk)")
xlabel("Frequency - Hz")
ylabel("Magnitude")

subplot(2,1,2)
plot(f, angle(Xf))
xlim([0 50])
title("Phase of Xs(fk)")
xlabel("Frequency - Hz")
ylabel("Phase - radians")


