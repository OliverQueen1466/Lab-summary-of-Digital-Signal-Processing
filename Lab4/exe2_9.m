function exe2_9()
[x, Fs] = audioread('drumloop2.wav');
h1 = [0.00506, 0, -0.04194, 0, 0.28848, 0.49679, 0.28848, 0, -0.04194, 0, 0.00506]
h2 = [0.00506, 0, -0.04194, 0, 0.28848, -0.49679, 0.28848, 0, -0.04194, 0, 0.00506]
conv1(:,1) = conv(x(:,1),h1);
conv1(:,2) = conv(x(:,2),h1);

conv2(:,1) = conv(x(:,1),h2);
conv2(:,2) = conv(x(:,2),h2);
N = length(x);
f=(0:N-1)*Fs/N; 
n=0:N-1;
y1 = fft(conv1);
y2 = fft(conv2);
figure(1)
plot(y1)
figure(2)
plot(y2)

