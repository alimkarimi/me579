function [xn_est] = mydecode(In,R, n)
%mydecode Summary of this function goes here
%   Detailed explanation goes here - This functoin takes positive integer
%   codes to get an estimate of the original sample before the coding.
%   Inputs are the In (integer codes), R (the range of volts possible in
%   the integer coding), and n (the number of bits in the converter). 
xn_est = -R + (In * ((2*R) / (2^n)));
end

