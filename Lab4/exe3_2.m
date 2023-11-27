function exe3_2()
a = [0.206572 0.413144 0.206571]
b = [1 0.369527 -0.195816]
[h,w] = freqz(b, a, 1024)
[gp,w1] = grpdelay(b,a,1024)
figure(1)
plot(w/pi,20*log10(abs(h)))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
figure(2)
plot(w/pi,gp)
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Group Delay')