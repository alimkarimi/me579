%not required to turn in - just for plotting

t = 0.3: 0.01 : 5;

tao = -1: .01 : 3.7;

ht = 10*exp(-5*(t - 0.3));

htminustao = 10*(10*exp(-5*((t - tao) - 0.3)));

subplot(2,1,1)
plot(t, ht);
subplot(2,1,2)
plot(tao, htminustao);


