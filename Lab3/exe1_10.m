function exe1_10()
[x,Fs]=audioread('speech_female.wav'); 
% soundsc(x(1:Fs * 5),Fs)
% soundsc(x(1:5:Fs * 5),Fs./5)
[N, Wn] = buttord(1/5, 1/4, 1, 40);
% Obtain the filter coefficients for a lowpass filter with
% a cutoff frequency of 1/4
[b,a] = butter(N,1/4,'low');
% pass the signal x through the filter defined by the
% coefficients in b and a
xf = filter(b,a,x);
soundsc(xf(1:5:Fs *5),Fs./5)