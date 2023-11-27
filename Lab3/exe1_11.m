function exe1_11()
[x,Fs]=audioread('speech_female.wav');
x = x(:,1);
x = x';
N = length(x);
t = (0:N-1)/Fs;
y = fft(x);
f = Fs/N*(0:round(N/2)-1);
% Determine the order necessary for the filter to have a
% passband edge of 1/5, a stopband edge of 1/4, a passband
% ripple of 1 dB, and a stopband attenuation of 40 dB
[N, Wn] = buttord(1/5, 1/4, 1, 40);
% Obtain the filter coefficients for a lowpass filter with
% a cutoff frequency of 1/4
[b,a] = butter(N,1/4,'low');
% pass the signal x through the filter defined by the
% coefficients in b and a
xf = filter(b,a,x);
figure(1)
subplot(211);
plot(t(1:Fs * 1.4),x(1:Fs * 1.4),'g');
xlabel('Time/s');ylabel('Amplitude');
title('Original Signal');
grid;
subplot(212);
plot(t(1:5:Fs * 1.4),xf(1:5:Fs*1.4),'g');
xlabel('Time/s');ylabel('Amplitude');
title('Downsample Signal');
grid;
figure(2)
y = fft(x(1:Fs * 1.4));
y1 = fft(xf(1:5:Fs * 1.4));
subplot(211); plot(abs(y));title('Original Signal');axis([0 4410 0 1000]);
subplot(212); plot(abs(y1));title('Original Signal');axis([0 4410 0 1000]);
