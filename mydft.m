function [Xk, fk] = mydft(xn, N, fs) %format:function [outputArg1,outputArg2] = mydft(inputArg1,inputArg2)
%The inputs to the function, should be the sampled time history xn, n = 0, 1, .., the number of
%samples of this time history to be used in the transform N, and the sample rate fs.
%The outputs of the function should be the frequencies fk (in Hz) and the Xk for k = ?N/2, .... ?
%1, 0, 1, ...N/2 ? 1. We typically pick N to be an even number.
%N samples in Tp seconds
%Own Discrete Fourier Transform

%loop for Xk
%first (i.e X0, where k =0), X0 =  the sum of all the xns (because the
%exp^0): xn0 (or 6) * e^-j2pi0*0/64 + xn1 (or 6.9795) * e^-j2pi0*1
%second (i.e X1, where k = 1, X1 = xn0 * e^j*2pi*1 * 0 / N  + xn1 *
%e^j2pi*1 * 1) * xn3 * e^j2pi*1*2/64 + xn4*e^j2pi*1*3/65
%third (i.e X2, where k = 2) - X2 = xn0 * e^-j2pi*3*0/64 + xn1 (or
%6.9795)*e^-j2pi3*1/64
Xk = zeros(1,N);
fk = zeros(1,N);
%set Xk = 0. It will eventually contain the sum of all the terms in the DFT
%first loop would look like:

for k = (-N/2):((N/2)-1)
    kk = k + N/2 + 1;
    Xk(kk) = 0;
    for n = 0:N-1
        Xk(kk) = Xk(kk) + (xn(n+1) * exp(-1i*2*pi*n*k/N));
        
    end
    fk(kk) = (k * (fs/N));
end
%outputArg2 = inputArg2;
end
