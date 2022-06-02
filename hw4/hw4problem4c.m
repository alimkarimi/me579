%HW 4 PROBLEM 4C

%  In your program use your function on the signals sampled at 128 samples
%  per second, raising the sampling
%  rate to 1024 samples per second, Compare the results with the original 
%  signals sampled at 1024 samples
%  per second. Also plot the difference between the results of your
%  upsampling and sampling the original
%  signals at 1024 samples per second, i.e., the error in the resampling 
%  method.

fs1 = 128;
delta1 = 1/fs1;
fs2 = 1024;
t = 0:delta1:(0.5-delta1);

xt = 10*sin(2*pi*30*t);
yt = 10*sin(180*t);
%{
figure(1)

subplot(2,1,1) %plot of xt sampled at fs = 128
plot(t, xt, 'x-')
title("Time history xt at fs = 128")
xlabel("Time - sec")
ylabel("x(t)")

subplot(2,1,2) %plot of yt sampled at fs = 128
plot(t, yt, 'x-')
title("Time history of yt at fs = 128")
xlabel("Time - sec")
ylabel("y(t)")
%}


[upsampled_xt, upsampled_yt] = myupsample(xt, yt, fs1, fs2); %upsampled to 1024
 

upsampled_t =  0:(1/fs2):0.5 - (1/fs2);
xt_1024 = 10*sin(2*pi*30*upsampled_t);
yt_1024 = 10*sin(180*upsampled_t);
figure(1)
subplot(2,1,1)
plot(upsampled_t, upsampled_xt); %resampled signal 
hold on
plot(upsampled_t, xt_1024) %original signal sampled at 1024
plot(t, xt, 'x-') %original signal at fs 128
title("x(t) upsampled to fs = 1024 vs x(t) sampled at fs = 1024")
xlabel("Time - sec")
ylabel("x(t)")
legend('x(t) sampled at 1024', 'x(t) upsampled to 1024', ...
    'original x(t) at 128')
hold off

subplot(2,1,2)
plot(upsampled_t, upsampled_yt); %yt upsampled from 128 to 1024
title("y(t) upsampled to fs = 1024 vs y(t) sampled at fs = 1024")
xlabel("Time - sec")
ylabel("y(t)")
hold on
plot(upsampled_t, yt_1024) %y(t) sampled at 1024
plot(t, yt, 'x-') %original signal at fs 128
legend('y(t) sampled at 1024', 'y(t) upsampled to 1024', ...
    'original y(t) at 128')
hold off

figure(2)
error_xt = upsampled_xt - xt_1024;
error_yt = upsampled_yt - yt_1024;
semilogy(upsampled_t, abs(error_xt))
hold on
semilogy(upsampled_t, abs(error_yt))
title("Errors between upsampling and original signal sampled at fs = 1024")
xlabel("Time - s")
ylabel("Error")
legend('Error in xt', 'Error in yt')
hold off



