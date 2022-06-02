function [fk, esd_est, N, q] = myesd_est(xn, fs, q)
%myesd_est Summary of this function goes here
%   This function estimates the energy spectral density of Exx(f), with
%   inputs being sampled time history, sampling rate, and q, the amount of
%   zero padding to add to the time history. Note that q=1 means no zero
%   padding (i.e 2 means add zeros that are the length of the original
%   signal). Estimate of Exx(f) is given by DFT^2

delta = 1/fs;

%  rectangular window:
wcomp = 1; 
%  rectangular window - will not use elsewhere in function but written here
%  for clarity

N = length(xn);
N = (N * q); % update N with degree of zero padding, q
esd_est = delta^2 * (fft(xn, N)).^2;

fk = zeros(1, N);
for k = 1:N
  fk(k) = k * (fs/N);
end

end

