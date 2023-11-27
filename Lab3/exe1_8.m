function exe1_8()
[x,Fs]=audioread('speech_female.wav');
x = x(:,1);
x = x';
N = length(x);
t = (0:N-1)/Fs;
y = fft(x);
f = Fs/N*(0:round(N/2)-1);
figure(1)
subplot(211);
plot(t(1:Fs * 1.4),x(1:Fs * 1.4),'g');
xlabel('Time/s');ylabel('Amplitude');
title('Original Signal');
grid;
subplot(212);
plot(t(1:5:Fs * 1.4),x(1:5:Fs*1.4),'g');
xlabel('Time/s');ylabel('Amplitude');
title('Downsample Signal');
grid;
figure(2)
y = fft(x(1:Fs * 1.4));
y1 = fft(x(1:5:Fs * 1.4));
subplot(211); plot(abs(y));title('Original Signal');axis([0 4410 0 1000]);
subplot(212); plot(abs(y1));title('Original Signal');axis([0 4410 0 1000]);
