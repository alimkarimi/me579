function [In] = myintcode(xt,R, n)
%myintcode 
%   Detailed explanation goes here: Function to simulate integer coding of
%   signal sample by an n bit analog to digital converter with a nominal
%   input range of +/- R volts. Inputs are samples of x(t), R, and n.
%   Outputs should be the integer codes in base 10, called In. If the
%   signal is outside of the volt range, the signal will have the code for
%   the max or min code (depending on if the signal was above the max or
%   below the min)


In = ((xt - (-R)) / (R - (-R))) * 2^n; %xt is a vector, In is a vector of
%integer codes. 
In = round(In);

%Handle voltages outside of integer coding bounds
for i = 1:length(xt)
    if In(i) > (2^n) - 1
        In(i) = (2^n) - 1;
    end
    if In(i) < 0
        In(i) = 0;
    end
end
    
    

end

