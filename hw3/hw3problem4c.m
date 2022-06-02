%HW 3, PROBLEM 4-C

A = 10;
alpha = 2;
fs = 50;
B = 20;
gamma = 1.25;

delta = 1/fs;

%Sample h(t) and x(t) until they become 0.05 of their max value.
t = 0:delta:4 - delta;

xn = A*exp(-alpha * t);
hn = B*exp(-gamma * t);

%subplot(2,2,1)
%plot(t, xn)
%subplot(2,2,2)
%plot(t, hn)

xnmax = 999; %initialize to something arbitrarily large
hnmax = 999; %initialize to something arbitrarily large


for x = 1:length(t)
    if xn(x) < 0.05 * xn(1)
        xnmax = x;
        break
    end
end

for x = 1:length(t)
    if hn(x) < 0.05 * hn(1)
        hnmax = x;
        break
    end
end

xn = xn(1:xnmax);
hn = hn(1:hnmax);


subplot(2,2,1)
plot(t(1:length(xn)), xn)
title("Xn plotted for until .05 of its max")
xlabel("Time")
ylabel("x(t)")
subplot(2,2,2)
plot(t(1:length(hn)), hn)
title("Hn plotted for until .05 of its max")
xlabel("Time")
ylabel("h(t)")

%Make a note of the lengths of their time series, Nx and Nh
Nx = length(1:length(xn));
Nh = length(1:length(hn));

N = Nx + Nh - 1; %for mydiscreteconv - this will be part of DFT length 
%there will be some zero padding). 
    

%Use mydiscreteconv to convolve the 2 sampled signals and compare to the
%continuous result from part a, assuming the same A, alpha, gamma, B
%parameters

[yn, Xsf, Hsf, Ysf] = mydiscreteconv(xn, hn, fs, N);
subplot(2,2,3)
plot(t(1:length(yn)), yn)
ylabel("y(t)")
title("Sampled signal for 0.05 of max input convolved with x(t)")
xlabel("Time")
hold on

%continuous yt = (A*B / gamma - alpha ) * (exp(-alpha*t) - exp(-alpha*t))
yt = (A*B / (gamma - alpha) ) * (exp(-alpha*t) - exp(-gamma*t));
plot(t(1:length(yn)), yt(1:length(yn)))
hold off

%differences between result in part a) and sampling time until the input's
%value is 0.05 times its maximum value. 
subplot(2,2,4)
error = abs(yt(1:length(yn)) - yn(1:length(yn)));
plot(t(1:length(yn)), error)
title("Error between signal truncated to 0.05 of max input and then convolved vs continuous convolution sampled at 50 sps")
xlabel("Time")
ylabel("Error")


