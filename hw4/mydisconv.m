function [yn, ty] = mydisconv(xn, hn, fs, tstartxn,tstarthn)
%mydisconv - Does a discrete convolution
%   Lower limit is when x becomes non-zero (i.e where overlap
%starts. In this function, we assume that 2 sequences start at 0
%, then we adjust time vector to account for any change in 
%the starting points. 
%Input to function are:
%      - 2 vectors - xn and hn
%      - sampling rate, fs
%      - starting point in time of xn
%      - starting point in time of hn

%Output is:
%      - yn - the discrete convolution values
%      - ty - the time vector for the values

%pseudocode:
%get length xn, get length hn, create n = xnlenght - hnlength - 1
%create y = zeros(length n) 

convlength = length(xn) + length(hn) - 1;
yn = zeros(1, convlength);

for j = 1:convlength
    if j <= round(convlength/2)
        yn(j) = (1/fs) * sum(xn(1:j) .* flip(hn(1:j)));
    end
    if j > round(convlength/2)
        yn(j) = 0;
    end    
end

ystart = tstartxn + tstarthn;
ty = (0:(1/fs):convlength*(1/fs) - (1/fs)) + ystart;

end

