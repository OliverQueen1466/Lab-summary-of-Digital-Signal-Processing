function exe1_3()
f = 1000;
t = 0 : 0.0001 : 1;
L = [1 2 4 8];
x = cos(2 * pi * f * t);
xd1 = x ( 1 : L(1) : end )
xd2 = x ( 1 : L(2) : end )
xd3 = x ( 1 : L(3) : end )
xd4 = x ( 1 : L(4) : end )
subplot(2,2,1);stem(fft(xd1),'Marker','none');set(gca,'ytick',t);xlabel('Frequency(Hz)');title('L = 1')
subplot(2,2,2);stem(fft(xd2),'Marker','none');set(gca,'ytick',t);xlabel('Frequency(Hz)');title('L = 2')
subplot(2,2,3);stem(fft(xd3),'Marker','none');set(gca,'ytick',t);xlabel('Frequency(Hz)');title('L = 4')
subplot(2,2,4);stem(fft(xd4),'Marker','none');set(gca,'ytick',t);xlabel('Frequency(Hz)');title('L = 8')
