function exe1_6()
M = [5, 21, 51]
for i = 1 : length(M) 
g = grpdelay(ones(1,M(i)) ./ M(i), 1, 1024, 'whole')
t = 0 :1/1024 :1-1/1024
plot(t,g)
ylabel('group delay')
xlabel('normalized frequency')
hold on
end
gtext({'5';'21';'51'})

