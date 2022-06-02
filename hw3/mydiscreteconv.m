function [yn, Xsf, Hsf, Ysf] = mydiscreteconv(xn, hn, fs, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Xsf = (1/fs)*fft(xn, N); %xn in the freq domain
Hsf = (1/fs)*fft(hn, N); %hn in the freq domain
Ysf = Hsf .* fs .* Xsf; % Ysf in the freq domain
yn = ifft(Ysf); %output yn by putting it back into the time domain to finish the convolution
end

%HW3 PROBLEM 4B
%Write a MATLAB function to take 2 discrete signals stored in a vector, xn
%and hn, and do a convolution of these 2 finite length discrete signals via
%multiplication in the frequency domain. You should give a sample rate to
%the function, as well as xn and hn. 

