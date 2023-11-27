function exe1_8()
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
x1 = filter(b1,a,x);
x2 = filter(b2,a,x);
t = 0 : 1/1024 : 1;
for i = 1:512
    han_win1(i) = han(i) * x1(i);
end
FT1=fft(han_win1,Ndata);
ydb1 = 20 * log10(abs(FT1)./max(abs(FT1)));
for i = 1:512
    han_win2(i) = han(i) * x2(i);
end

FT2=fft(han_win2,Ndata);
ydb2 = 20 * log10(abs(FT2)./max(abs(FT2)));
subplot(3,1,1);plot(t(1:Ndata/2),FT_dB(1:Ndata/2)*10);xlabel('Normalized Frequency');axis([0 0.5 -60 0]);
subplot(3,1,2);plot(t(1:Ndata/2),ydb1(1:Ndata/2)*10);ylabel('Magnitude(dB)');axis([0 0.5 -60 0])
subplot(3,1,3);plot(t(1:Ndata/2),ydb2(1:Ndata/2)*10);xlabel('Normalized Frequency');axis([0 0.5 -60 0])