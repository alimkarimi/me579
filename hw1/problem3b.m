%solution to HW problem 1-3b
%create xn vectors, use those vectors as input to the mydft function,
%and use mydft to plot the amplitude and phase spectra. 

%for 3b equation i
xn = zeros(1,64)
fs = 64;
Np = 64;
t = (0:(Np - 1))/fs;

xn = 10*sin(2*pi*14*(t)) + 6*cos(2*pi*21*(t));

[prob1Ck, prob1fk] = mydft(xn, Np, fs) 

%plot amplitude spectrum
prob1Ck = (1/64) * prob1Ck;
prob1Ck_amp = sqrt(real(prob1Ck).^2 + imag(prob1Ck).^2);
subplot(4,2,1)
stem(prob1fk,prob1Ck_amp)
title("frequency vs amplitude of Ck for equation i")
xlabel("frequency in Hz")
ylabel("|Ck| in m")

prob1Ck_phase = zeros(1,64);

%calculate phase:
for a = 1:length(prob1Ck)
    if real(prob1Ck(a)) > 0 && imag(prob1Ck(a)) > 0
        prob1Ck_phase(a) = atan(imag(prob1Ck(a))/real(prob1Ck(a)))
    elseif real(prob1Ck(a)) > 0 && imag(prob1Ck(a)) < 0
        prob1Ck_phase(a) = atan(imag(prob1Ck(a))/real(prob1Ck(a)))
    elseif real(prob1Ck(a)) < 0 && imag(prob1Ck(a)) >= 0
        prob1Ck_phase(a) = atan(imag(prob1Ck(a))/real(prob1Ck(a))) + pi
    elseif real(prob1Ck(a)) < 0 && imag(prob1Ck(a)) < 0
        prob1Ck_phase(a) = atan(imag(prob1Ck(a)) / real(prob1Ck(a))) - pi
    elseif real(prob1Ck(a)) == 0 && imag(prob1Ck(a)) > 0
        prob1Ck_phase(a) = pi/2
    elseif real(prob1Ck(a)) == 0 && imag(prob1Ck(a)) < 0
        prob1Ck_phase(a) = -pi/2
    elseif real(prob1Ck(a)) == 0 && imag(prob1Ck(a)) == 0
        prob1Ck_phase(a) = 0
    end
end

%clean up phase values for very small Ck
for x = 1:Np
    if abs(prob1Ck(x)) < 10^-13
        prob1Ck_phase(x) = 0;
    end
end
subplot(4,2,2)
stem(prob1fk, prob1Ck_phase)
title("frequency vs phase of Ck for equation i")
xlabel("frequency in Hz")
ylabel("phase of Ck in radians")


%for 3b equation ii
xn = zeros(1,66)
fs = 64;
Np = 66;
t = (0:(Np - 1))/fs;

xn = 10*sin(2*pi*14*(t)) + 6*cos(2*pi*21*(t));
[prob2Ck, prob2fk] = mydft(xn,Np,fs)
prob2Ck = (1/66) * prob2Ck
prob2Ck_amp = sqrt(real(prob2Ck).^2 + imag(prob2Ck).^2)
subplot(4,2,3)
stem(prob2fk,prob2Ck_amp)
title("frequency vs amplitude of Ck for equation ii")
xlabel("frequency in Hz")
ylabel("|Ck| in m")

prob2Ck_phase = zeros(1,66) 
%calculate phase for equation ii
for a = 1:length(prob2Ck)
    if real(prob2Ck(a)) > 0 && imag(prob2Ck(a)) > 0
        prob2Ck_phase(a) = atan(imag(prob2Ck(a))/real(prob2Ck(a)))
    elseif real(prob2Ck(a)) > 0 && imag(prob2Ck(a)) < 0
        prob2Ck_phase(a) = atan(imag(prob2Ck(a))/real(prob2Ck(a)))
    elseif real(prob2Ck(a)) < 0 && imag(prob2Ck(a)) >= 0
        prob2Ck_phase(a) = atan(imag(prob2Ck(a))/real(prob2Ck(a))) + pi
    elseif real(prob2Ck(a)) < 0 && imag(prob2Ck(a)) < 0
        prob2Ck_phase(a) = atan(imag(prob2Ck(a)) / real(prob2Ck(a))) - pi
    elseif real(prob2Ck(a)) == 0 && imag(prob2Ck(a)) > 0
        prob2Ck_phase(a) = pi/2
    elseif real(prob2Ck(a)) == 0 && imag(prob2Ck(a)) < 0
        prob2Ck_phase(a) = -pi/2
    elseif real(prob2Ck(a)) == 0 && imag(prob2Ck(a)) == 0
        prob2Ck_phase(a) = 0
    end
end

%clean up phase values for very small Ck
for x = 1:Np
    if abs(prob2Ck(x)) < 10^-13
        prob2Ck_phase(x) = 0;
    end
end
subplot(4,2,4)
stem(prob2fk, prob2Ck_phase)
title("frequency vs phase of Ck for equation ii")
xlabel("frequency in Hz")
ylabel("phase of Ck in radians")

%for 3b equation iii
xn = zeros(1,32)
fs = 32;
Np = 32;
t = (0:(Np - 1))/fs;

xn = 10*sin(2*pi*14*(t)) + 6*cos(2*pi*21*(t));
[prob3Ck, prob3fk] = mydft(xn, Np, fs)
prob3Ck = (1/32) * prob3Ck
prob3Ck_amp = sqrt(real(prob3Ck).^2 + imag(prob3Ck).^2)
subplot(4,2,5)
title("frequency vs amplitude for equation iii")
stem(prob3fk,prob3Ck_amp)
xlabel("frequency in Hz")
ylabel("|Ck| in m")

%calculate and plot phase for equation iii
prob3Ck_phase = zeros(1,32) 
for a = 1:length(prob3Ck)
    if real(prob3Ck(a)) > 0 && imag(prob3Ck(a)) > 0
        prob3Ck_phase(a) = atan(imag(prob3Ck(a))/real(prob3Ck(a)))
    elseif real(prob3Ck(a)) > 0 && imag(prob3Ck(a)) < 0
        prob3Ck_phase(a) = atan(imag(prob3Ck(a))/real(prob3Ck(a)))
    elseif real(prob3Ck(a)) < 0 && imag(prob3Ck(a)) >= 0
        prob3Ck_phase(a) = atan(imag(prob3Ck(a))/real(prob3Ck(a))) + pi
    elseif real(prob3Ck(a)) < 0 && imag(prob3Ck(a)) < 0
        prob3Ck_phase(a) = atan(imag(prob3Ck(a)) / real(prob3Ck(a))) - pi
    elseif real(prob3Ck(a)) == 0 && imag(prob3Ck(a)) > 0
        prob3Ck_phase(a) = pi/2
    elseif real(prob3Ck(a)) == 0 && imag(prob3Ck(a)) < 0
        prob3Ck_phase(a) = -pi/2
    elseif real(prob3Ck(a)) == 0 && imag(prob3Ck(a)) == 0
        prob3Ck_phase(a) = 0
    end
end

%clean up phase values for very small Ck
for x = 1:Np
    if abs(prob3Ck(x)) < 10^-13
        prob3Ck_phase(x) = 0;
    end
end
subplot(4,2,6)
stem(prob3fk, prob3Ck_phase)
title("frequency vs phase of Ck for equation iii")
xlabel("frequency in Hz")
ylabel("phase of Ck in radians")

%theoretical results from problem 3c:
%We are adding a plot to the 6 plot figure that shows the amplitude and
%phase for the mathematically derived amplitude and phase spectrum. 

subplot(4,2,7)
theoretical_fk = -28:28;
theoretical_amp = zeros(1,57);
theoretical_amp(8) = 3;
theoretical_amp(15) = 5;
theoretical_amp(50) = 3;
theoretical_amp(43) = 5;
stem(theoretical_fk, theoretical_amp)
title("THEORETICAL frequency vs amplitude spectrum of Ck")
xlabel("frequency in Hz")
ylabel("|Ck| in m")

subplot(4,2,8)
theoretical_phase = zeros(1,57);
theoretical_phase(15) = pi/2;
theoretical_phase(43) = -pi/2;
stem(theoretical_fk, theoretical_phase)
xlabel("frequency in Hz")
ylabel("phase of Ck in radians")
title("THEORETICAL frequency vs phase spectrum of Ck")


