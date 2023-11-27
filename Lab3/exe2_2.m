function exe2_2()
t = 0 : 0.001 : 1;
Fs = 1000;
f = 200;
x = cos(2 * pi * f * t);
M = [1 2 4 8]
for i = 1:length(M)
    subplot(2,2,i);plot(abs(fft(upsample(x,M(i)))));set(gca,'ytick',t);title('L = ' ,M(i));axis([0 (M(i)*Fs) 0 10]);xlabel('Frequency(Hz)')
end