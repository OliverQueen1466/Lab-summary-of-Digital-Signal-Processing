function exe2_2()
N = 1024;
fs = 1
f=(0:N-1)*fs/N; 
n=0:N-1;
x1 = [0.00506, 0, -0.04194, 0, 0.28848, 0.49679, 0.28848, 0, -0.04194, 0, 0.00506]
y1=fft(x1,N);
subplot(2,1,1);
n=0:N-1;
mag = 20 * log10(abs(y1) ./ max(abs(y1)))
T = ones(1,N) .* (11 - 1) ./ (2 )
subplot(2,2,1); plot(f(1:N/4),T(1:N/4),'-')
xlabel('Normalized frequency')
ylabel('Group delay(samples)')
subplot(2,2,2);
plot(f(1:N/2),mag(1:N/2)); 
title('Magnitude response');
xlabel('Normalized Frequency');
ylabel('dB');
subplot(2,2,[3 4]);
plot(f(1:N/2),unwrap(angle(y1(1:N/2))),'.');
title('phase response');
xlabel('Normalized Frequency');
ylabel('arg');
