% HW 7-1 C

%  NOTE: IF THIS PROGRAM DOES NOT RUN B/C X IS NOT DEFINED, NEED TO RUN
%  HW7PROB1B FIRST TO DEFINE X

% c) Repeat the calculation in (b) (ii) 10 times but using different blocks
% of the original signal. First time use samples 1 to 46,000, second time 
% use samples 46,001 to 92000, etc. Plot all 10 results on the same graph
% and plot semilogy for plotting.

first = 1 : 46000 : 460000 - 45999;
last = 46000 : 46000 : 460000;

for sim = 1:length(last)
    [Sxx, fk, Npseg, Tseg, fres, NFFT, df] = mypsdanalysis(x(first(sim):last(sim)), fresd, 1, overlap, fs, 1, 2);
    figure(3)
    semilogy(fk, Sxx)
    title("2 Sided PSD, Hann Windowed Segments, 2.5Hz res, 50% Overlap - 10 runs")
    xlabel("Freq - Hz")
    ylabel("Power - Volts^2 / Hz")
    hold on
end
legend('Seg 1', '2', '3', '4','5','6','7','8','9','10')
hold off