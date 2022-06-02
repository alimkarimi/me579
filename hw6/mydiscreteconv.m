function [yn, Xsf, Hsf, Ysf] = mydiscreteconv(xn, hn, fs, N, scaling)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if scaling == 1 %1 means impulse already scaled, no need to include scaling
    Xsf = fft(xn, N); %xn in the freq domain %update for HW 5 - 1/fs not needed here. 
    Hsf = fft(hn, N); %hn in the freq domain  %update for HW 5 - 1/fs not needed here.
    Ysf = Hsf .* Xsf; % Ysf in the freq domain
    yn = real(ifft(Ysf)); %output yn by putting it back into the time domain to finish the convolution
end

if scaling == 2 %2 means impulse needs to be scaled - multiply Xsf and Hsf by fs  
   Xsf = fs * fft(xn, N); 
   Hsf = fs * fft(hn, N);
   Ysf =  Hsf .* Xsf;
   yn = real(ifft(Ysf));
end
%HW3 PROBLEM 4B
%Write a MATLAB function to take 2 discrete signals stored in a vector, xn
%and hn, and do a convolution of these 2 finite length discrete signals via
%multiplication in the frequency domain. You should give a sample rate to
%the function, as well as xn and hn. 

