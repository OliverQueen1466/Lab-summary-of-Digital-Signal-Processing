function exe1_2()
f = 1000;
t = 0 : 0.0001 : 1;
x = cos(2 * pi * f * t);
y = fft(x)
stem(y,'Marker','none');set(gca,'ytick',t);
xlabel('Frequency(Hz)');axis([0 10000 0 5000]);