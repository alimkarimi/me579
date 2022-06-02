%use problem 1 as example
fk = 0:20:60; %fk in 1 is vector from 0 to 60, incrementing at 20. This is when k = 3. 
 %fs is 60 * 20, in this case
T = 0.05; %we know from the problem 1 that period is .05 seconds
Np = 4; %we want to plot 4 periods
t0 = 0; 
figure(1)
orient tall


%use k up to 3
v = [3, 30, 90];
for ii = 1:3
    fk = 0:20:20*v(ii);
    Ck = zeros(1,v(ii)+1); %enough elements for k = 0 to k = 3, 30, or 90
    
        for k = 1:(v(ii)+1)  
            Ck(k) = 50 * (((exp(1*i*pi/2 - 1*i*pi*(k-1)) - exp(-1*i*pi/2 + 1*i*pi*(k-1)))) / (1*i*20* pi - 1*i*40*pi*(k-1)) +  ((exp(-1*i*pi/2 - 1*i*pi*(k-1)) - exp(1*i*pi/2 + 1*i*pi*(k-1)))) / (-1*i*20* pi - 1*i*40*pi*(k-1)));
        end 

    [xt, t] = mytimehistory(fk,Ck, T, Np, t0);


    subplot(4, 1, ii) 
    plot(t, xt)
    title(['Number of terms = ' int2str(v(ii))])
    xlabel("Time - Seconds")
    ylabel("Est. x(t) - V")
end




%plot x(t) from problem 1

x = abs(5*cos(pi*20*t));
subplot(4,1,4)
plot(t, x)
xlabel("Time - Seconds")
ylabel("x(t) - V")
title("Original Signal")

%can create a 2 row label by creating a 2 dim character array

%A good exercise will be to subtract estimate from actual signal for each v
%We will see that the errors are concentrated at the discontinuities in the
%derivative
