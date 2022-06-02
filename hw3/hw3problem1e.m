%HW 3 PROBLEM 1E - 

%program to sample and plot the input x(t), the impulse response h(t), and the output
%y(t)

%x(t) is 10 between -0.2 <= t <= 0.4, 0 everywhere else

%h(t) is 10*exp(-5*(t - 0.3)) for t >= 0.3, 0 everywhere else

%create t vector

t = -0.3: 0.01 : 0.9;


%sample x(t)

xt = zeros(1, length(t)); %empty vector for xt

for x = 1:length(t)
    if (t(x) <= 0.4) && (t(x) >= -0.2)
        xt(x) = 10;
    end
end

subplot(3,1,1)
plot(t, xt)
ylim([-5 15])
xlim([-0.3 0.9])
title("Input to system sampled")
xlabel("Time in s")
ylabel("N")


%sample h(t)

ht = zeros(1, length(t));

for x = 1:length(t)
    if t(x) >= 0.3
        ht(x) = 10*exp(-5*(t(x) - 0.3));
    end
end

subplot(3,1,2)
plot(t, ht)
ylim([-5 15])
title("Impulse Response sampled")
xlabel("Time in s")
ylabel("N/Ns")

%sample y(t)

yt = zeros(1, length(t));

for x = 1:length(t)
    if t(x) < 0.1
        yt(x) = 0;
    elseif t(x) >= 0.1 && t(x) <= 0.7
        yt(x) = 20 - 20*exp(-5*(t(x)-0.1));
    else %t(x) > 0.7
        yt(x) = 20*exp(-5*(t(x)-0.7)) - 20*exp(-5*(t(x)-0.1));
        %yt(x) = 100*exp(-5*(t(x) - 0.3))*((-exp(-0.2*-5) + exp(0.4*-5))/-5);
    end
end

subplot(3,1,3)
plot(t, yt)
title("Output Sampled")
xlabel("Time in s")
ylabel("N")