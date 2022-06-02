z = zeros(1,11)

for k = 1:11  
    z(k) = 50 * (((exp(1*i*pi/2 - 1*i*pi*(k-1)) - exp(-1*i*pi/2 + 1*i*pi*(k-1)))) / (1*i*20* pi - 1*i*40*pi*(k-1)) +  ((exp(-1*i*pi/2 - 1*i*pi*(k-1)) - exp(1*i*pi/2 + 1*i*pi*(k-1)))) / (-1*i*20* pi - 1*i*40*pi*(k-1)))
end
 %polynomial form of Ck above. Easier to evaluate than to do integration in
 %Matlab
 

%{
fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(0/0.05).*t);
z(1) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(1/0.05).*t);
z(2) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(2/0.05).*t);
z(3) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(3/0.05).*t);
z(4) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(4/0.05).*t);
z(5) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(5/0.05).*t);
z(6) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(6/0.05).*t);
z(7) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(7/0.05).*t);
z(8) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(8/0.05).*t);
z(9) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(9/0.05).*t);
z(10) = 100.*integral(fun, -.025, .025)

fun = @(t) cos(20.*pi.*t).*exp(-1i.*2.*pi.*(11/0.05).*t);
z(11) = 100.*integral(fun, -.025, .025)
3.1831 + 0.0000i   1.0610 + 0.0000i  -0.2122 - 0.0000i   0.0909 + 0.0000i  -0.0505 + 0.0000i   0.0322 + 0.0000i  -0.0223 - 0.0000i   0.0163 - 0.0000i  -0.0125 - 0.0000i   0.0099 + 0.0000i   0.0066 - 0.0000i

%}

X_freq = 0:20:200;
Y_mag = sqrt(z.^2);
subplot(2,1,1);
stem(X_freq,2*Y_mag) %%multiply by 2 because we are plotting a one sided magnitude spectrum
xlabel("Frequency (Hz)")
ylabel("Magnitude |Ck| - volts")
title("Frequency vs Magnitude") 

Y_phase = zeros(1,11);
for j = 1:11
    if z(j) < 0
        Y_phase(j) = atan(0./z(j)) - pi;
    end
    if z(j) > 0
        Y_phase(j) = atan(0./z(j));
    end
end
%code for phase plot below
%can re-use same vector for X_freq
subplot(2,1,2);
stem( X_freq, Y_phase)
xlabel("Frequency (Hz)")
ylabel("Phase of Ck - radians")
title("Frequency vs Phase")
