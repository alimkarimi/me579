%HW 7 - 1 part b
%  Write a program to call mypsdanalysis. Generate a sampled voltage that
%  is 0 mean, Gaussian distributed, and random with a standard deviation of
%  sqrt(fs). fs = 8192. You may use randn() to help generate this, 

%generate random signal. This will be of mean 0, var 1
signal_samples = 460000;
z = randn(1, signal_samples);
mean(z) % close to 0
var(z) % close to 1

% apply transformation : X = sqrt(fs) * Z. We want to keep mean at 0, but
% increase the variance from 1 to fs (or the std dev to sqrt(fs)). 
fs = 8192;

x = sqrt(fs) * z;
mean(x) % mean is close to 0
var(x) %var is sqrt(fs) ^ 2
std(x) %std dev of x is close to 90, which is the sqrt of 8192


%plot random signal
delta = 1/fs;

t = 0 : delta : delta * signal_samples - delta;
figure(1)
plot(t, x)
title("Random Signal with 0 mean and sqrt(fs) std-dev")
xlabel("Time - s")
ylabel("Volts")

fresd = 2.5;
overlap = 0.5; %50 percent overlap is desired

%command to run first 3 simulations in 7-1b:
% Run your function three times using parts of the signal you generated: (i) use samples 1 to 4600, (ii)
%use samples 1 to 46,000, and (iii) use samples 1 to 460,000. Choose a desired resolution of fresd=2.5
%Hz, a hann window (iwopt=1), 50% overlap, no zero padding (if there is enough data) (zpopt=1), and a
%two-sided psd. Plot all three results on the same graph and use semilogy for plotting. 
first = [1 1 1];
last = [4600, 46000, 460000];

for sim = 1:3
    [Sxx, fk, Npseg, Tseg, fres, NFFT, df] = mypsdanalysis(x(first(sim):last(sim)), fresd, 1, overlap, fs, 1, 2);
    figure(2)
    semilogy(fk, Sxx)
    title("2 Sided PSD, Hann Windowed Segments, 2.5Hz res, 50% Overlap")
    xlabel("Freq - Hz")
    ylabel("Power - Volts^2 / Hz")
    hold on
    Npseg
    Tseg
    fres
    NFFT
end
legend('Samples 1:4600', 'Samples 1:46000', 'Samples 1:460000')
hold off
% arg1: x --> random signal
% arg2: desired freq res of Sxx
% arg3: window type - 1 = Hann, 2 = Rect
% arg4: percent overlap between segments
% arg5: sampling rate of random signal x
% arg6: zpopt --> 1 = make number of pts in seg a power of 2 that exceeds fresd
%                 2 = keep window length that is required for the desired fresd
%                     and zero pad to next efficient length (2^q)
% arg7: itype --> 1 = 1 sided PSD, 2 = 2 sided PSD



