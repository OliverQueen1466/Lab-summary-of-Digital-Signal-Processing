function exe1_1()
omega = 0:1/800:0.5;
a = omega * 2 * pi
H5 = (1/5)*(1-exp(-i*a*5))./(1-exp(-i*a));
H21 = (1/21)*(1-exp(-i*a*21))./(1-exp(-i*a));
H51 = (1/51)*(1-exp(-i*a*51))./(1-exp(-i*a));
plot(omega,[abs(H5);abs(H21);abs(H51)])
xlabel('Normalized Frequency')
ylabel('Magnitude')
gtext({'5';'21';'51'})
axis([0, 0.5, 0, 1])