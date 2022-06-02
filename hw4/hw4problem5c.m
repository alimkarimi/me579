%  HW 4 - PROBLEM 5C

%  Unit circle DOES lie in the region of convergence, so we evaluate z at
%  e^jpi2fdelta to get Xs(f). 

%  Expression for z-transform is: A / z - a

A = 1;
fs = 100;
a = 0.95;
N = 513;
k = 0:1:N-1;
f = k * (fs/N);
z = exp(1i*pi*2*f*(1/fs)); %delta, i.e 1/fs, cancels the fs in f as 
% fs * delta is 1. Put it here just to show it in equation, but could 
% have wrote f = k * (1/N) and left out the delta to keep computation 
% efficient for an HPC setting. 

Xz = A ./ (z - a);
subplot(2,1,1)
plot(f, abs(Xz))
title("Magnitude of Xs(f)")
xlim([0 50])
xlabel("Frequency - Hz")
ylabel("Magnitude")
subplot(2,1,2)
plot(f, angle(Xz))
xlim([0 50])
title("Phase of Xs(f)")
ylabel("Phase - Radians")
xlabel("Frequency - Hz")
