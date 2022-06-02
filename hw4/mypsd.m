function [Sxxf,fk] = mypsd(xn, N, fs, window_type) 
%PROBLEM 3-C
%mypsd Summary of this function goes here
%   Detailed explanation goes here - A function to apply a window to a
%   given signal (xn) that includes power compensation and plots the
%   estimated PSD from 0 to half the sample rate (fs). Inputs should be
%   time history (xn), number of points in the signal you want to use (N),
%   an option for different windows (window_type), and the sampling rate
%   (fs). 

%From problem 3-b, we derived that Sxxf = (abs(fft, N))^2 / (N * (1/fs)) *
%window type wcomp (0.375 for a Hann window). 

%Note on usage - if window_type == 1, then assume Hann window. if
%window_type == 2, assume rectangular window. 


if window_type == 1
    wcomp = 0.375;
    %apply window
    t = (1/fs)*(-N/2:((N/2) - 1)); %-T/2 to T/2 - this window doesn't have discontinuities. 
    T = N * (1/fs);
    hann = 0.5 + 0.5 * cos((2 * pi * t) / T);
    xn = xn .* hann;
    
end
if window_type == 2
    wcomp = 1; 
    %window would just multiply by 1 everywhere, so keep xn the same
end

delta = 1/fs;
Sxxf = (delta * abs(fft(xn, N)).^2) / (N * wcomp);
Sxxf = Sxxf(1:((N/2) + 1));

fk = (0:(N/2)) * (fs/N);


end

