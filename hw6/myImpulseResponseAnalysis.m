function [f, Gsf] = myImpulseResponseAnalysis(gn, gstart, fs, pz)
%myImpulseResponseAnalysis - Summary of this function:
%   This function takes gn, this impulse response of an Ng length FIR
%   filter, gstart, the start time of gn, and fs. the function draws 4
%   plots in one figure: 1)the filter's impulse response, 2) the pole-zero map,
%   the 3) magnitude and 4) phase of the filter's frequency response
%   pz is an integer - if 1, run pz map code, if 2, do not run that code.


figure(1)
%first plot - plotting the filter's impulse response
subplot(2,2,1)
delta = 1/fs;
gend = gstart + ((length(gn) - 1) * delta);
%t = gstart:delta: (-gstart); commenting out for trouble shooting
t = gstart: delta : gend;
length(t);
plot(t, gn);
title("Filter Impulse Response")
xlabel("Time - s")
ylabel("Response")

%second plot - pole zero map using pzmap.m
if pz == 1
    pzmap(gn, fs, gstart, 2, 2, 2) 
end
if pz == 2
    %do nothing
end

%third plot - magnitude of the filter's frequency response
N = length(gn) * 8; %for 0 padding Gs(f)
%write code to make N a power of 2^q - take log2(N) - round it, and choose
%to that value. 
k = 0:N-1; %k should always be starting at 0 and end at N-1!!!!
f = k * fs / N;
Gsf = fft(gn, N) .* exp(-1i * 2 * pi .* f * gstart);
subplot(2,2,3)
plot(f,abs(Gsf))
title("Filter Frequency Response")
xlabel("Frequency - Hz")
ylabel("Magnitude")
xlim([0 fs/2])


%fourth plot - phase of the filter's frequency response
subplot(2,2,4)
plot(f, angle(Gsf))
title("Phase of Filter's Frequency Response")
xlabel("Frequency - Hz")
ylabel("Radians")
xlim([0 fs/2])

end

