%HW 2, Problem 1-c
%{
     Use MATLAB to plot the force amplitude density spectrum in dB (ref 1 N) [=20log10|X(j2?f)|
for the following 3 sets of values for to and A: (i) to=0.05 seconds and A = 20 Newtons, (ii)
to=0.01 seconds and A = 100 Newtons, and (iii) to=0.001 seconds and A = 1000 Newtons. Note
in each of these the area under the function in time is the same and equal to 1 Newton-second.
Plot the positive-frequency part of the spectrum only. You will need to be careful setting up the
frequency vector to make sure you highlight all the interesting behavior in all three cases. Use the
same frequency vector for all three cases, and base your frequency vector on the case that has the
smallest spacing in frequency between two 0 values of the function, picking around 10 frequency
values between these 0 values in the spectrum. Choose the upper frequency to be 2000 Hz.
Try plotting the magnitude (in dB) plots all on the same graph. Also note, because the magnitude
goes to zero at some points, the dB values get very large and negative, so you will need to reset
the y-axis to see the details better away from these zero values. Set it to be a range of 50 dB with
the maximum being the value in dB at f=0 Hz.
%}

%From HW2 problem 1-b, I think the FT is A * (exp(-i*2*pi*f*t0) - 1) / (-i * 2
%* pi * f)

%amplitude spectrum is: A * (exp(-i*2*pi*f*t0)^2 - 1^2)^(-1/2) / (( 2
%* pi * f)^2)^(1/2)

%we want 10 discrete frequencies between 0 values. We know that Amplitude
%will be 0 when f = 0, 1, 2, 3, etc, as we will have 2pi rotations on the
%exponent term
f = 0:0.1:2000;
t0 = [.05, .01, .001];
A = [20, 100, 1000];

%calculate amplitude density spectrum for the f, t0, and A vectors above. 
for ii = 1:3
    Xf = A(ii) * (exp(-i * 2 * pi * f * t0(ii)) - 1) ./ (-i .* 2 .* pi .* f);
    amp = 20*log10(abs(Xf));
    subplot(1,2,1)
    hold on
    plot(f, amp)
    ylim([-50 0])
    title(['Amplitude Density Spectrum, A = 20, 100, 1000'] )
    xlabel("Frequency - Hz")
    ylabel("DB / Hz") %or should it be N/Hz?
    legend('A = 20', 'A = 100', 'A = 1000') 
    %use vividdoc to customize fonts and line thickness in plots
    
    %amp = 20*log10(abs(A(ii) * t0 * sinc(f*t0(ii)))); % ask Yongjie about
    %signal processing toolbox
    
    subplot(1, 2, 2)
    hold on
    ph = angle(Xf);
    plot(f, ph)
    title(['Phase Spectrum, A = 20, 100, 1000'])
    xlabel("Frequency - Hz")
    ylabel("Radians")
    legend('A = 20, t0 = .05', 'A = 100, t0 = .01', 'A = 1000, t0 = .001')
end

subplot(1,2,1)
hold on
plot(f, zeros(size(f))-3) %create line in plot for amplitude = -3, so
%it is easy to see / visualize the bandwidth.


