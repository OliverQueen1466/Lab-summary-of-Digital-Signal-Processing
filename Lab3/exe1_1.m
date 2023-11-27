function exe1_1()
f = 10;
t = 0 : 0.00001 : 1;
L = 1000;
x = cos(2 * pi * f * t);
xd = x ( 1 : L : end )
figure(2)
stem(xd)
