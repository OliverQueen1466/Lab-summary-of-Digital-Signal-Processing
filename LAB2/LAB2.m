exe2_5();
function exe1_1()
    n= 0:1:31;
    xn = sin(2*pi*220*n/2048);
    stem([0:31],xn)
end
function exe1_2()

fs=2048; 
Ndata=32; 
N=32; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*220*n/2048);   
end
y=fft(x,N);                                                                                     
mag=abs(y);    
f=(0:N-1)*fs/N; 
stem(f(1:N/2),mag(1:N/2)*2/N); 
xlabel('Frequency(Hz)');ylabel('|x|');
title('Ndata=32 Nfft=32');grid on;
atan2(128,1)
end
function exe1_4()
    n= 0:1:31;
    xn = sin(2*pi*128*n/220);
    stem([0:31],xn)
end

function exe1_7()

fs=2048; 
Ndata=32; 
N=32; 
n=0:Ndata-1;t=n/fs;   
for n = 1:32
    x(n)=sin(2*pi*220*n/2048);   
end
y=fft(x,N);   
y_ifft = ifft(y,N)
stem(t,y_ifft)
title('recovered signal'),xlabel('time'),ylabel('amplitude')
% mag=abs(y);    
% f=(0:N-1)*fs/N; 
% stem(f(1:N/2),mag(1:N/2)*2/N); 
% xlabel('Frequency(Hz)');ylabel('|x|');
% title('Ndata=32 Nfft=32');grid on;
% atan2(128,1)
    

end

function exe1_8()

fs=2048; 
N=512;  
for n = 1:512
    x(n)=sin(2*pi*220*n/2048);   
end
y=fft(x,N);   
mag=abs(y);    
f=(0:N-1)*fs/N; 
stem(f(1:N/2),mag(1:N/2)*2/N); 
xlabel('Frequency(Hz)');ylabel('|x|');
end
function exe2_1()
N = [100,200,300,400,500,600,700,800,900,1000];
fs=1000;

for i = 1:10
    for n = 1 : 128
        x(n) = sin(2 * pi * n * N(i)./1000);
    end
    y = x;
    subplot(4,3,i), stem([0:127],y);
    title(i)
end
end
function exe2_3()
N = [100,200,300,400,500,600,700,800,900,1000];
fs=1000;
for i = 1:10
    for n = 1 : 128
        x(n) = sin(2 * pi * n * N(i)./1000);
    end
    y = fft(x,N(i));
    mag=abs(y);    
    a = 0;
    for j = 1 : length(mag)
        if a < mag(j)
            a = mag(j);
        end
    end
    mag = mag./a;
    f=(0:N(i)-1)*fs/N(i); 
    subplot(4,3,i), stem(f(1:N(i)/2),mag(1:N(i)/2)*2/N(i)); 
    title(i);xlabel('Frequency(Hz)');ylabel('|x|');
end
end
function exe2_31()
fs=1000; 
Ts = 1 / fs; 
L = 32; 
t = (0 : (L - 1)) * Ts; 
a = 0;
N = [100,200,300,400,500,600,700,800,900,1000];
for i = 7 : 10
    L = N(i);
    t = (0 : (L - 1)) * Ts;
    for n = 1:32
        x(n)=sin(2*pi*N(i)*n/1000);   
    end
    y=fft(x,N(i));   
    y_ifft = ifft(y,N(i));
    for j = 1 : length(y_ifft)
        if a < y_ifft(j)
            a = y_ifft(j);
        end
    end
    y_ifft = y_ifft./a;
    subplot(2,2,i-6), stem(t,y_ifft);
    title('recovered signal',i),xlabel('time'),ylabel('amplitude')
end
end

function exe2_5()
clear all
sndfile = 'speech_female.wav';%load the wav file
[x,Fs] = audioread(sndfile);%reads data from the wav, and returns sampled data, x, and a sample rate for that data, Fs.
N = 512;%sample numbers
[S,F,T] = spectrogram(x(1:Fs*1.4),N,3*N/4,N*4,Fs);%Spectrogram using short-time Fourier transform.It  returns the spectrogram at the cyclical frequencies specified in f
f = figure('Position',[500 300 700 500],'MenuBar','none', ...%create a figure window to show image
 'Units','Normalized');
set(f,'PaperPosition',[0.25 1.5 8 5]);
axes('FontSize',14);%specifies the limits for the current axes.
imagesc(T,F./1000,20*log10(abs(S)));% Display the data in array as an image that uses the range of colors in the colormap.
axis xy;
set(gca,'YTick',[0:2000:Fs/2]./1000, ...
'YTickLabel',[0:2000:Fs/2]./1000);%Set graphics object properties
ylabel('Frequency (kHz)');% add y axis label 
xlabel('Time (s)');%add x axis label
end







