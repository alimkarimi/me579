% HW 6 - PROBLEM 1A

% DESIGN A 63 POINT FIR Differentiator using firpm(). Use same specs as 5-4
% (i.e fs = 2048)

% Amplitude vector will be A = [0 2pif1, 0 0] and freq vector before
% normalization would be like [0 f1, f2, fs/2]

% Plot the impulse response, PZmap, and frequency response. May need to use
% frunction from last hw (HW 5) to plot. May need to adjust specs to
% improve design. 

fs = 2048;
delta = 1/fs;
f1 = fs * 0.4;
f2 = fs * 0.45;

N = 63; %question asks for a 63 point FIR filter

order = N - 1;

A = [0, 2*pi*f1, 0, 0];

fr = [0, f1, f2, fs/2];

fnorm = fr / (fs/2); %fr normalized - this is the input firpm wants

gn = firpm(order, fnorm, A, 'differentiator'); %filter impulse response 

t_gn = ((-order/2) * delta): delta: ((order/2) * delta);
%t_gn = 0 : delta : order * delta;

myImpulseResponseAnalysis(gn, t_gn(1), fs, 1);
