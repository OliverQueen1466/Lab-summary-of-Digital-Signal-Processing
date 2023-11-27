function exe1_1()
b1 = (2 ^ (-0.5)) .* [1 1];
b2 = (2 ^ (-0.5)) .* [1 -1];
a = [1];
[h1,w1] = freqz(b1,a);
[h2,w2] = freqz(b2,a);
plot(w1/pi,abs(h1));
hold on
plot(w2/pi,abs(h2));
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
legend('lowpass','highpass')