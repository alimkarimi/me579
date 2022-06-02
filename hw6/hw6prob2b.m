%  HW 6 - Problem 2b

%hand derived coefficients of H(s) - only from LHS of plane. 
s0 = 100 * pi * exp(1i * (pi/2 + pi/4));
s1 = conj(s0);


fs = 1000;
delta = 1/fs;


%hand calculated coefficients - compare this with butter output
coeffs0 = s0 * s1
coeffs1 = (-s1 - s0)
coeffs2 = 1

%  compare your coefficients with the one from the MATLAB program butter
N = 2;
Wn = 2 * pi * 50;

[B, A] = butter(N, Wn, 's');
A %A is equal to coeffs2, coeffs1, and coeffs0
B %B is equal to coeffs0

%define alpha and gamma in terms of s0 and s1 to create G(z)
alpha = (s0 + (2/delta)) / (s0 - (2/delta));
gamma = s0 / (s0 - (2/delta));

b1 = gamma * conj(gamma);
b2 = 2 * gamma * conj(gamma);
b3 = gamma * conj(gamma);

a1 = 1;
a2 = 2 * real(alpha);
a3 = alpha * conj(alpha);

b = [b1, b2, b3];
a = [a1, a2, a3];
x = [1, zeros(1, 100)];


filt_imp = filter(b, a, x);

%frequency response and impulse response of G(z)
myImpulseResponseAnalysis(filt_imp, 0, fs, 2);