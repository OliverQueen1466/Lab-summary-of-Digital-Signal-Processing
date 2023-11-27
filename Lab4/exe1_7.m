function exe1_7()
[x1,Fs1] = audioread('drumloop2.wav');
[x2,Fs2] = audioread('KillaloeCathedral.wav');
sound(x2,Fs2)
L1 = length(x1);
L2 = length(x2);
L = L1 + L2 - 1;
F1 = fft(x1,L);
F2 = fft(x2,L);
F_mul = F1 .* F2;
a = ifft(F_mul);
% soundsc(a)

