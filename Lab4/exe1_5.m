function exe1_5()
M = 6;
h = ones(M,M)./M^2;
[H,Fx,Fy] = freqz2(h,[256 256]);
mesh(Fx,Fy,abs(H));