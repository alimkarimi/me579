%HW 4 PROBLEM 3F - plot on same axis 
fs = 128;
delta = 1/fs;
t = 0:delta:(2-delta);
xt = 0.3*sin(120*t) + 0.2 * cos(132*t) + 0.4*sin(180*t);

n = [8, 24, 16, 16];
R = [1, 1, 0.5, 20];

[Sxxf_before, fk_before] = mypsd(xt, length(xt), fs, 1);
figure(3)
semilogy(fk_before, Sxxf_before)
title("Power Spectral Density before coding and decoding")
xlabel("Frequency - Hz")
ylabel("Power")



for a = 1:4
    [In_coding] = myintcode(xt, R(a), n(a));
    [xt_est] = mydecode(In_coding, R(a), n(a));
    plusQ = (2 * R(a) / 2^n(a)) / 2;
    minusQ = -(2 * R(a) / 2^n(a)) / 2;
    figure(1)
    subplot(2,2,a)
    plot(t, xt_est - xt)
    hold on
    plot(t, (zeros(1, length(t)) + plusQ))
    plot(t, (zeros(1, length(t)) + minusQ))
    sgtitle("Error by coding and decoding signals")
    title("Error - R = " + R(a)...
        + " n = " +n(a) + " bits")
    xlabel("Time - s")
    ylabel("Error - V")
    
    % plot power spectral density of decoded x
    % xt_est is the decoded signal. Use that as an input to the myesd_est.m
    % function
    
    [Sxxf,fk] = mypsd(xt_est, length(xt_est), fs, 1);
    figure(2)
    subplot(2,2,a)
    semilogy(fk,Sxxf, fk_before, Sxxf_before)
    sgtitle("Power Spectral Density of Decoded Signals and Before Coding/Decoding")
    title("PSD of decoded x- R = " + R(a)...
        + " n = " +n(a) + " bits")
    xlabel("Frequency - Hz")
    ylabel("Power")
    legend('PSD - Decoded', 'PSD - Before')

end


