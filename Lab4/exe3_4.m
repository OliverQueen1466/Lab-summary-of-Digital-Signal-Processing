function exe3_4()
a = [1 -0.9];
b = [-0.9 1];
[h,w] = freqz(b,a,1024);
[gp,w1] = grpdelay(b,a,1024)
N = length(h)
N1 = length(gp)
subplot(2,2,1);plot(w(1:(N/2))/pi,h(1:(N/2)));
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
subplot(2,2,2);plot(w(1:(N/2))/pi,unwrap(angle(h(1:N/2))))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase')
subplot(2,2,[3 4]); plot(w1(1:(N1/2))/pi,gp(1:(N1/2)))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Group Delay')