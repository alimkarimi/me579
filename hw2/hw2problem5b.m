%Problem 5b - HW 2

fs = 1024; %1024 samples per second
duration = [0.5, 4, 4, 4]; %corresponds to duration of samples taken at fs Hz.

t1 = 0:(1/1024):(duration(1) -1/1024);
t2 = 0:(1/1024):(duration(2) -1/1024);
t3 = 0:(1/1024):(duration(3) - 1/1024);
t4 = 0:(1/1024):(duration(4) - 1/1024);


yt1 = 10*sin(100*pi*t1 + .125*cos(8*pi*t1));
yt2 = 10*sin(100*pi*t2 + .125*cos(8*pi*t2));
yt3 = 10*sin(100*pi*t3 + .625*cos(16*pi*t3));
yt4 = 10*sin(100*pi*t4 + 3.125*cos(8*pi*t4));


%FIRST SAMPLING
N = length(t1); %number of samples
Yf = fft(yt1,N);
fk = zeros(1, N);
for k = 1:N-1
    fk(k) = (k * (fs/N));
end

%FIRST PLOT
subplot(4,1,1)
plot(fk, (1/fs)*abs(Yf))
ylabel("|Ck| - Volts")
xlabel("Frequency - Hz")
xlim([0 128])
title("0.5s, fm = 4 Hz, gamma=0.1")

%SECOND SAMPLING
N = length(t2); %number of samples
Yf = fft(yt2);
fk = zeros(1,N);
for k = 1:N-1
    fk(k) = (k * (fs/N));
end

%SECOND PLOT
subplot(4,1,2)
plot(fk, (1/fs)*abs(Yf))
ylabel("|Ck| - Volts")
xlabel("Frequency - Hz")
xlim([0 128])
title("4s, fm = 4 Hz, gamma=0.1")


%THIRD SAMPLING
N = length(t3); %number of samples
Yf = fft(yt3);
fk = zeros(1,N);
for k = 1:N-1
    fk(k) = (k * (fs/N));
end

%THIRD PLOT
subplot(4,1,3)
plot(fk, (1/fs)*abs(Yf))
ylabel("|Ck| - Volts")
xlabel("Frequency - Hz")
xlim([0 128])
title("4s, fm = 8 Hz, gamma=0.1")


%FOURTH SAMPLING
N = length(t4); %number of samples
Yf = fft(yt4);
fk = zeros(1,N);
for k = 1:N-1
    fk(k) = (k * (fs/N));
end

%FOURTH PLOT
subplot(4,1,4)
plot(fk, (1/fs)*abs(Yf))
ylabel("|Ck| - Volts")
xlabel("Frequency - Hz")
xlim([0 128])
title("4s, fm = 4 Hz, gamma=0.25")


