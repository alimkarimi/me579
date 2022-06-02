function [resampled_xt, resampled_yt, Xf_orig, Yf_orig, Xf, Yf, fkX_orig,...
    fkY_orig, fkX, fkY, piX] = myupsample(xt, yt,fs1, fs2)
%myupsample upsamples signal from fs1 to fs2 
%   Zero pads the DFT of the signal in the freq domain. Need to take care
%   with complex conjugate symmetry about half the new (fs2) sample rate
%   and note that the last value in the 0-padded spectrum should be just
%   before fs2 at fs2 - df Hz. It should also be the complex conjugate of
%   the second term, k = 1 in the spectrum at df, where df is the spectral
%   resolution in Hz. We will also have to scale the spectrum.

%  The inputs to the function will be the signal samples (i.e xt and yt),
%  the original sample rate (fs1), and the new sample rate, (fs2). The
%  output of the function will be the resampled time history. 
Xf_orig = fft(xt);

Yf_orig = fft(yt);

Nx = length(xt);

Ny = length(yt);

num_zeros_to_pad_Xf = ((fs2/fs1) - 1) * Nx;

num_zeros_to_pad_Yf = ((fs2/fs1) - 1) * Ny;

zero_vector_x = zeros(1, num_zeros_to_pad_Xf); 
zero_vector_y = zeros(1, num_zeros_to_pad_Yf);


%generate original fk vector - this is the frequency axis for fs1
fkX_orig = zeros(1, length(xt)); %set x-axis, frequency resolution points - 0 for now

fkY_orig = zeros(1, length(yt)); %set x-axis, frequency resolution points - 0 for now

for k = 1:length(fkX_orig)
    fkX_orig(k) = (k * fs1) / Nx; %assign values to freq axis using length of time hist
end

for k = 1:length(fkY_orig)
    fkY_orig(k) = (k* fs1) / Ny; %assign values to freq axis using length of time hist
end
%end generating original fk vector - this has the frequency axis for fs1

%plot original spectrum
%{
subplot(2,2,1)
plot(fkX, abs(Xf))
title("fkX, Xf original")
subplot(2,2,2)
plot(fkY, abs(Yf))
title("fkY, Yf original")
%}

%find the index of fs/2
piX = fkX_orig(Nx/2); %pi stands for pivot index - should be at fs/2 which is the N/2 index
piY = fkY_orig(Ny/2); %pi stands for pivot index - should be at fs/2 which is the N/2 index

piX = find(fkX_orig == piX); %pivot index to add zeros around for frequency axis of Xf
piY = find(fkY_orig == piY); %pivot index to add zeros around for frequency axis of Yf


%add zeros to Xf vector
Xf = [Xf_orig(1:piX), zero_vector_x, Xf_orig((piX + 1): length(Xf_orig))];

%add zeros to Yf vector
Yf = [Yf_orig(1:piY), zero_vector_y, Yf_orig((piY + 1): length(Yf_orig))];

%fkY = [fkY(1:piY)];  %make fk longer, so that it can have the same vector length as Xf-zero
  %padded and so that we can plot fk vs Xf-zero padded
%fkY
%update fk vectors for Xf and Yf so that the frequencies match the zero-padded length. Need 
%this for plotting and to represent the upsampling. The end of this vector
%should be frequency fs2. 
for x = 1:length(Xf) - 1
    fkX(x) = x * (fs2 /length(Xf));
end
%done updating fk for Xf

for x = 1:length(Yf) - 1
    fkY(x) = x * (fs2 / length(Yf));
end
%done updating fk for Yf

resampled_xt = real((fs2/fs1)*ifft(Xf));
resampled_yt = real((fs2/fs1)*ifft(Yf));

end

