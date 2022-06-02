function [Sxx, fk, Npseg, Tseg, fres, NFFT, df] = mypsdanalysis(x, fresd,...
    iwopt, overlap, fs, zpopt, itype)
%mypsdanalysis Summary of inputs:
%   x --> time domain signal
%   fresd --> desired freq res i.e 1 Hz, 2 Hz, etc
%   iwopt --> type of window. 1 = Hann, 2 = Rect
%   fs --> sampling rate
%   zpopt --> 1 = make number of pts in seg a power of 2 that exceeds fresd
%             2 = keep window length that is required for the desired fresd
%   itype --> 1 = 1 sided PSD, 2 = 2 sided PSD
%   Summary of outputs:
%   Sxx --> PSD which is  conj(fft(seg)) *. fft(seg) / Tseg * Wcomp
%   fk --> frequencies that correspond to Sxx
%   Nseg --> number of segments possible with desired fresd
%   Tseg --> Window size in seconds, keeping desired fresd and Nseg
%   fres --> 1 / Tseg
%   NFFT --> number of points in DFT
%   df --> frequency spacing = fs / NFFT


%   figure out how many segments we can make at desired freq res w/ a given
%   signal length:

sig_len = length(x); %figure out signal length
    
fres_w_oneseg = fs/ sig_len; % if we had one segment, the fres would be the
%  sampling rate, fs, divided by the length of the signal. For example, if
%  the fs = 1,000 and signal length was 5,000, then the fres = 1k / 5k =
%  0.2 Hz

%  But, we actually want to know the length of segment while keeping the
%  desired freq res, fresd. We could take smaller segments and still meet
%  our requirement. Plus, we could generate a more realistic power spectral
%  density estimate because we are taking more segments

Npseg = sig_len * (fres_w_oneseg / fresd);
% As described above, we should be able to get the desired freq res 
% we want while keeping the the segments smaller if our freq res with one 
% segment is less than our desired freq res. The above equation is 
% multiplying the signal length (sig_len) by (the freq res of the entire signal 
% treated as one segment divided by our desired freq res (fresd)). For 
% example, if our signal length was 100 and our requirement was 5 Hz while
% sampling at fs = 100, we would actually have 1 Hz resolution (fs /
% length = 1), and therefore have more space for segments. Dividing the
% resoltuion given by making the entire signal one segment by fresd and
% multiplying by the signal length tells us how many segments we can make
% in the entire signal while keeping the minimum requirement for the fresd.

%Now that we know the minimum segment length to meet our desired frequency
%resolution, we need to understand if we are 0 padding to make computation
%efficient or if we are taking a larger segment (increase segment size to
%next power of 2 - i.e if segment is 500, make it 512 = 2^9). This is based
%on the zpopt argument
if zpopt == 1 %take larger segment to make segment length a power of 2
    Npseg = 2^ceil(log2(Npseg));
    NFFT = Npseg; 
end
if zpopt == 2 %zero pad signal from Npseg + 1 to the next power of 2
    zeros_to_add = 2^ceil(log2(Npseg)) - Npseg; %next power of 2 minus original len of Npseg.
    % for example, if next power of 2 was 512, orig signal was 500, this
    % makes NFFT 512 while keeping Npseg 500, and pwelch knows to add 12
    % zeros. 
    NFFT = Npseg + zeros_to_add; %need to keep NFFT and Npseg in both cases - base window on Npseg
end
    
%Now that we know the segment length we will use for efficient computationn, 
% we need to specify the windowing for that segment:
if iwopt == 1 %Hann window
    Npseg_window = hann(Npseg, 'periodic');
end
if iwopt == 2 %rectangular window
    Npseg_window = ones(1, length(Npseg));
end

delta = 1/fs;
Tseg = NFFT * delta; %convert the segment length to time, by multiplying 
%  the number of points in the segment by the sampling interval.

fres = 1 / Tseg; %define freq resolution of output - likely not the same as
% desired input, but will be better.

df = fs / NFFT ;

%calculate overlap based on input overlap argument:
overlap = Npseg * (1 - overlap);

%call pwelch based on one or two sided PSD argument
if itype == 1 %one sided PSD
    [Sxx] = pwelch(x, Npseg_window, overlap, NFFT, fs, 'onesided');
    k = 0:(NFFT) / 2; %understand why this goes from 0 while the two sided
    %psd goes from 1:NFFT!!! 
    fk = k * df; %includes fs over two - therefore one extra point. 
end
if itype == 2 %two sided PSD
    [Sxx] = pwelch(x, Npseg_window, overlap, NFFT, fs, 'twosided');
    k = 1: NFFT; %2 sided is every freq up to but not including fs. 
    fk = k * df; 
end

end

