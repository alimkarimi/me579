% Compare your values of N and omega*c with the output 
% of the MATLAB program buttord

fs = 1000; 
delta = 1/fs;

%hand math below:
wd1 = 2* pi * 100;
wd2 = 2* pi * 200;

wa1_hand = (2 / delta) * tan((wd1 * delta) / 2); %analog spec 
wa2_hand = (2 / delta) * tan((wd2 * delta) / 2); %analog spec

k1 = 1; %max attenuation at stopband
k2 = 72; %max attenuation at passband

%solve for N
N_top = 0.5*log10((10^(k2 / 10) - 1) / (10^(k1 / 10) - 1));

N_bottom = log10(wa2_hand / wa1_hand);

N_hand = ceil(N_top / N_bottom); %round up

%solve for wc:
wc_hand = wa1_hand / ((10^(k1/10) - 1)^(1/(2*N_hand)))
wc_hand2 = wa2_hand / ((10^(k2/10) - 1)^(1/(2*N_hand)))

%prep parameters for buttord:
Rp = 1; %passband ripple of no more than 1 dB
Rs = 72; %stopband ripple of no more than 72 dB

Wp = wa1_hand %passband frequency after pre-warp
Ws = wa2_hand %stopband frequency after pre-warp

%run buttord
[N, wc] = buttord(Wp, Ws, Rp, Rs, 's') %add 's' for computation for an analog filter


