function exe2_4()
t = 0 : 0.001 : 1;
f = 200;
x = cos(2 * pi * f * t(100:200));
y = upsample(x,3)
subplot(211);stem(y);axis([100 200 -1.2 1.2]);
% passband edge of 0.4, a stopband edge of 0.5, a passband
% ripple of 0.1 dB, and a stopband attenuation of 40 dB
[N, Wn] = buttord(0.4, 0.5, 0.1, 40);
% Obtain the filter coefficients for a lowpass filter with
% a cutoff frequency of 0.4
[b,a] = butter(N,Wn,'low');
% pass the signal x through the filter defined by the
% coefficients in b and a
xuf = 3*filter(b,a,y);
subplot(212);stem(xuf);axis([100 200 -1.2 1.2]);