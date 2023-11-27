function exe3_5()
a = [1 -0.9 ];
b = [-0.9 1];
a1 = [1];
b1 = [1]
[h1,w2] = freqz(b1,a1,1024);
[h,w] = freqz(b,a,1024);
[gp,w1] = grpdelay(b,a,1024);
[gp1,w3] = grpdelay(b,a,1024);
N = length(h)
N1 = length(gp)
subplot(2,2,1);plot(w(1:(N/2))/pi,0.5 * (h(1:(N/2))+h(1:(N/2))));
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')
subplot(2,2,2);plot(w(1:(N/2))/pi,unwrap(0.5 *(angle(h(1:N/2))+angle(h1(1:N/2)))))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase')
subplot(2,2,[3 4]); plot(w1(1:(N1/2))/pi,0.5 * (gp(1:(N1/2))+gp1(1:(N1/2))))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Group Delay')