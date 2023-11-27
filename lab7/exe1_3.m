function exe1_4()
x = zeros(1,512)
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
han = hann(512);
for i = 1:512
    han_win(i) = han(i) * x(i);
end
FT=fft(han_win,Ndata);
f=(0:Ndata-1)*fs/Ndata;
ydb = 20 * log10(abs(FT)./max(abs(FT)));
x1 = filter(b1,a,x);
x2 = filter(b2,a,x);
scal = (x1 + x2) ./ x;
subplot(311);plot(x);
subplot(312);plot(x1);ylabel('Amplitude');
subplot(313);plot(x2);xlabel('Time(s)');
