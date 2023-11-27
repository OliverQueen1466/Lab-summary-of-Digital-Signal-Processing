function exe1_2()
x = zeros(1,512);
for i = 1 : 512
    for j = 0 : 9
        x(i) = x(i) + rand(1) * cos(2* pi * rand(1) * i + 2 * pi *rand(1));
    end
end
b1 = (2 ^ (-0.5)) .* [1 1];
b2 = (2 ^ (-0.5)) .* [1 -1];
a = [1];
Ndata = 1024;
fs = 2 * pi;
f=(0:Ndata-1)*fs/Ndata;
han = hann(512);
for i = 1:512
    han_win(i) = han(i) * x(i);
end
FT=fft(han_win,Ndata);

FT_dB = 20 * log10(abs(FT)./max(abs(FT)));
t = 0 : 1/1024 : 1;
subplot(2,1,1);plot(x);xlabel('Time(n)');ylabel('Amplitude');
subplot(2,1,2);plot(t(1:Ndata/2),FT_dB(1:Ndata/2));xlabel('Normalized Frequency');ylabel('Amplitude');axis([0 0.5 -60 0]);

