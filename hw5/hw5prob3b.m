%HW 5 PROBLEM 3-B

B = 25;
fs = 1000;
delta = 1/fs;
f1 = 250;
M = 63;

t = -M*delta:delta:(M*delta);

ht = 2*B * (sin(pi * B * t) ./ (pi * B * t)) .* cos(2*pi*f1*t); 
%cos(2*pi*f1 * t) == exp((-1i * 2*pi*f1*t)+ exp(1i * 2*pi*f1*t))
a = find(t == 0); %element / index of where t vector is 0s as I do not have the image processing toolbox in MATLAB

ht(a) = 2*B * cos(2*pi*f1*t(a));
ht = delta * ht;
%figure(2)
%plot(t, ht)
%title("t, ht (not windowed yet)")

T = (2*(t(1)/delta)+2)*delta; %128 when gstart is -63

wt = (0.5 * cos((2*pi*t) / T)) + 0.5; %hann window with 128 points - 1 on each
%side of the first and last point in h(t)

hwt = ht .* wt;
[fvec] = myImpulseResponseAnalysis(hwt,t(1), fs); %return frequency vector 
% so it can be re-used when superimposing |H(f)|

%superimpose original |H(f)| over subplot (2,2,3)

subplot(2,2,3)
% . H(f) is 1 for:
%  from -f1 - B/2 to -f1 + B/2 
%  f1 - B/2 to f1 + B/2

Hf_orig = zeros(1,length(fvec));

for x = 1:length(Hf_orig)
    if fvec(x) > (-f1 - (B/2)) && fvec(x) < (-f1 + (B/2))
        Hf_orig(x) = 1;
    end
    if fvec(x) < (f1 + (B/2)) && fvec(x) > (f1 - (B/2))
        Hf_orig(x) = 1;
    end
end

hold on
plot(fvec, Hf_orig)
hold off

%the transition region is small, so this filter isn't great. A hann window
%would help. If you make a longer window, you make M bigger and have a
%larger order, which could help too. 
    
