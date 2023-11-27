 exe1_3();

function exe1_1()
fs=2048; 
Ndata=32; 
N=1024; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*220*n/2048);   
end
y=fft(x,N);   
y1 = fft(x,Ndata);                                                                                  
mag=abs(y);    
f=(0:N-1)*fs/N; 
f1 = (0:Ndata-1)*fs/Ndata;
mag1 = abs(y1);
plot(f(1:N/2),mag(1:N/2)); 
hold on
stem(f1(1:Ndata/2),mag1(1:Ndata/2));
ylabel('|x|');
xlabel('Frequency(Hz)')

end

function exe1_2()
fs=2048; 
Ndata=32; 
N=1024; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*128*n/2048);   
end
y=fft(x,N);   
y1 = fft(x,Ndata);                                                                                  
mag=abs(y);    
f=(0:N-1)*fs/N; 
f1 = (0:Ndata-1)*fs/Ndata;
mag1 = abs(y1);
plot(f(1:N/2),mag(1:N/2)); 
hold on
stem(f1(1:Ndata/2),mag1(1:Ndata/2));
ylabel('|x|');
xlabel('Frequency(Hz)')

end

function exe1_3()
fs=2048; 
Ndata=32; 
N=2048; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*128*n/2048) + 0.2*sin(2*pi*220*n/2048) + 0.01*cos(2*pi*525*n/2048);   
end
y=fft(x,N);   
y1 = fft(x,Ndata);                                                                                  
mag=abs(y);    
f=(0:N-1)*fs/N; 
f1 = (0:Ndata-1)*fs/Ndata;
mag1 = abs(y1);
plot(f(1:N/2),mag(1:N/2)); 
hold on
stem(f1(1:Ndata/2),mag1(1:Ndata/2));
ylabel('|x|');
xlabel('Frequency(Hz)')

end

function exe2_1()
rec = boxcar(32);
tri = triang(31);
for n = 0 : 31
 sine(n+1) = sin(pi*n/31);
end
han = hamming(32);
plot(rec)
% gtext('rectangle window')
hold on
plot(tri)
% getxt('triangle window')
hold on
plot(sine)
% gtext('sine window')
hold on
plot(han)
gtext({'hanning window';'sine window';'triangle window';'rectangle window'})
end

function exe2_2()
rec = boxcar(32);
tri = triang(31);
for n = 0 : 31
 sine(n+1) = sin(pi*n/31);
end
han = hamming(32);

recfft = fft(rec,1024);
recfft = abs(recfft);
recfft = fftshift(recfft);
n = linspace(-0.5,0.5,1024);
subplot(2,2,1), plot(n,recfft),title('Rectangular');
xlabel('f');
trifft = fft(tri,1024);
trifft = abs(trifft);
trifft = fftshift(trifft);
n = linspace(-0.5,0.5,1024);
subplot(2,2,2), plot(n,trifft),title('Triangular');
xlabel('f');
sinefft = fft(sine,1024);
sinefft = abs(sinefft);
sinefft = fftshift(sinefft);
n = linspace(-0.5,0.5,1024);
subplot(2,2,3),plot(n,sinefft),title('Sine');
xlabel('f');
hanfft = fft(han,1024);
hanfft = abs(hanfft);
hanfft = fftshift(hanfft);
n = linspace(-0.5,0.5,1024);
subplot(2,2,4),plot(n,hanfft),title('Hann');

xlabel('f');
end

function exe2_3()
rec = boxcar(32);
tri = triang(31);


recfft = fft(rec,1024);
recfft = abs(recfft);
recfft = fftshift(recfft);
recfft = 20*log10(abs(recfft)./max(abs(recfft)));
n = linspace(-0.5,0.5,1024);
plot(n,recfft),title('Rectangular');
hold on

trifft = fft(tri,1024);
trifft = abs(trifft);
trifft = fftshift(trifft);
trifft = 20*log10(abs(trifft)./max(abs(trifft)));
n = linspace(-0.5,0.5,1024);
plot(n,trifft,'--'),title('Triangular');
axis([-0.2 0.2 -80 5]);
xlabel('f');
legend('Rectangular','Triangular');
end

function exe2_4()
for n = 0 : 31
 sine(n+1) = sin(pi*n/31);
end
han = hamming(32);

sinefft = fft(sine,1024);
sinefft = abs(sinefft);
sinefft = fftshift(sinefft);
sinefft = 20*log10(abs(sinefft)./max(abs(sinefft)));
n = linspace(-0.5,0.5,1024);
plot(n,sinefft),title('Sine and Hann');
hold on

hanfft = fft(han,1024);
hanfft = abs(hanfft);
hanfft = fftshift(hanfft);
hanfft = 20*log10(abs(hanfft)./max(abs(hanfft)));
n = linspace(-0.5,0.5,1024);
plot(n,hanfft,'--');
axis([-0.2 0.2 -80 5]);
xlabel('f');
legend('Sine','Hann');
end

function exe3_1()
fs=2048; 
Ndata=32; 
N=2048; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*128*n/2048) + 0.2*sin(2*pi*220*n/2048) + 0.01*cos(2*pi*525*n/2048);   
end
rec = boxcar(32);
tri = triang(32);
for n = 0 : 31
 sine(n+1) = sin(pi*n/31);
end
han = hamming(32);

for m = 1 :32
    y1(m) = x(m) * rec(m);
    y2(m) = x(m) * tri(m);
    y3(m) = x(m) * sine(m);
    y4(m) = x(m) * han(m);
end
y1 = fft(y1);
y2 = fft(y2);
y3 = fft(y3);
y4 = fft(y4);                                                                             
mag1=abs(y1);    
mag2=abs(y2); 
mag3=abs(y3); 
mag4=abs(y4); 

f=(0:Ndata-1)*fs/Ndata;

subplot(2,2,1), stem(f(1:Ndata/2),mag1(1:Ndata/2)./max(mag1)),title('Rectangular') ; 
subplot(2,2,2), stem(f(1:Ndata/2),mag2(1:Ndata/2)./max(mag2)),title('Triangular') ; 
subplot(2,2,3), stem(f(1:Ndata/2),mag3(1:Ndata/2)./max(mag3)),title('Sine'); 
subplot(2,2,4), stem(f(1:Ndata/2),mag4(1:Ndata/2)./max(mag4)),title('Hamm') ; 
end

function exe3_2()
fs=2048; 
Ndata=32; 
N=2048; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*128*n/2048) + 0.2*sin(2*pi*220*n/2048) + 0.01*cos(2*pi*525*n/2048);   
end
rec = boxcar(32);
tri = triang(31);
for n = 0 : 31
 sine(n+1) = sin(pi*n/31);
end
han = hamming(32);

for m = 1 :32
    y1(m) = x(m) * rec(m);
    
    y3(m) = x(m) * sine(m);
    y4(m) = x(m) * han(m);

end
for m = 1:31
    y2(m) = x(m) * tri(m);
end

y1 = fft(y1,2048);
y2 = fft(y2,2048);
y3 = fft(y3,2048);
y4 = fft(y4,2048);      


mag1=20 * log10(abs(y1)./max(abs(y1)));    
mag2=20 * log10(abs(y2)./max(abs(y2))); 
mag3=20 * log10(abs(y3)./max(abs(y3))); 
mag4=20 * log10(abs(y4)./max(abs(y4))); 

f=(0:Ndata-1)*fs/Ndata;

subplot(2,2,1), plot(f(1:32/2),mag1(1:32/2)),title('Rectangular') ; 
subplot(2,2,2), plot(f(1:Ndata/2),mag2(1:Ndata/2)),title('Triangular') ; 
subplot(2,2,3), plot(f(1:Ndata/2),mag3(1:Ndata/2)),title('Sine'); 
subplot(2,2,4), plot(f(1:Ndata/2),mag4(1:Ndata/2)),title('Hamm') ; 
end

function exe3_4()

[x,Fs] = audioread('speech_female.wav');

han = hamming(length(1 : Fs * 1.4));

for i = 1 : length(x(1:Fs *1.4))
    y(i) = x(i) * han(i);
end
N = length(x(1:Fs * 1.4));
t = (0:N-1)/Fs;
plot(t,y(1:Fs * 1.4));
xlabel('Time(s)');
ylabel('Amplitude');
end

function exe3_5()
[x,Fs] = audioread('speech_female.wav');

a = length(1 : Fs * 1.4);
Ndata = a;

han = hamming(length(1 : Fs * 1.4));

for i = 1 : length(x(1:Fs *1.4))
    y(i) = x(i) * han(i);
end

N = length(x(1:Fs * 1.4));
t = (0:N-1)/Fs;

y = fft(y);

f1 = (0:Ndata-1)*Fs/Ndata;

mag1 = 20 * log10(abs(y)./max(abs(y)));

plot(mag1(1:Ndata/2));
xlabel('Frequency(Hz)');
axis([0 10000 -60 1]);
end

function exe3_6()
Ndata = 2048;
[x,Fs] = audioread('speech_female.wav');
y = x(Fs * 0.15 : Fs * 0.15 + 2047);
han = hamming(2048)
for i = 1 : 2048
    y_win(i) = y(i) * han(i)
end
y_win = fft(y_win);
y_win = 20 * log10(abs(y_win)./max(abs(y_win)));
f=(0:Ndata-1)*Fs/Ndata;
plot(f(1:Ndata),y_win(1:Ndata))
ylabel('dB');
xlabel('Frequency(Hz)');
end

function exe3_7()
Ndata = 2048;
[x,Fs] = audioread('speech_female.wav');
y = x(Fs * 0.5 : Fs * 0.5 + 2047);
han = hamming(2048)
for i = 1 : 2048
    y_win(i) = y(i) * han(i)
end
y_win = fft(y_win);
y_win = 20 * log10(abs(y_win)./max(abs(y_win)));
f=(0:Ndata-1)*Fs/Ndata;
plot(f(1:Ndata/2),y_win(1:Ndata/2))
ylabel('dB');
end

function exe3_8()
send = 'speech_female.wav';
[x,Fs] = audioread('speech_female.wav');

a = 2048*19.090/length(x) 
end