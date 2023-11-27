function exe1_6()
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
han_win = upsample(han_win(1:2:end),2);
FT=fft(han_win,Ndata);
FT_dB = 20 * log10(abs(FT)./max(abs(FT)));
x1 = filter(b1,a,x);
x2 = filter(b2,a,x);
t = 0 : 1/1024 : 1;
for i = 1:512
    han_win1(i) = han(i) * x1(i);
end
han_win1 = upsample(han_win1(1:2:end),2);
FT1=fft(han_win1,Ndata);
ydb1 = 20 * log10(abs(FT1)./max(abs(FT1)));
for i = 1:512
    han_win2(i) = han(i) * x2(i);
end
han_win2 = upsample(han_win2(1:2:end),2);
FT2=fft(han_win2,Ndata);
ydb2 = 20 * log10(abs(FT2)./max(abs(FT2)));
for i = 1:512
    han_win3(i) = han(i) .* (x2(i)+x1(i));
end
han_win3 = upsample(han_win3(1:2:end),2);
FT3=fft(han_win3,Ndata);
ydb3 = 20 * log10(abs(FT3)./max(abs(FT3)));
subplot(4,1,1);plot(t(1:Ndata/2),abs(FT(1:Ndata/2)));xlabel('Normalized Frequency');
subplot(4,1,2);plot(t(1:Ndata/2),abs(FT1(1:Ndata/2)));ylabel('Magnitude');
subplot(4,1,3);plot(t(1:Ndata/2),abs(FT2(1:Ndata/2)));ylabel('Magnitude');
subplot(4,1,4);plot(t(1:Ndata/2),abs(FT3(1:Ndata/2)));xlabel('Normalized Frequency');