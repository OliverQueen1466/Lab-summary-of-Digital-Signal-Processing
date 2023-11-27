[x,Fs] = audioread('PDQBach.wav');
x = x(1:Fs*2);
% soundsc(x,Fs);
numChannels = 100;
lowFreq = 20;
[fcoefs]=MakeERBFilters(Fs,numChannels,lowFreq);
xout = ERBFilterBank(x, fcoefs);
t = [0:numChannels:length(xout)-1]./Fs;
f = figure('Position',[500 300 600 600], ...
'Units','Normalized');
set(f,'PaperPosition',[0.25 1.5 8 8]);
left = 0.07; top = 0.09;
width = 0.88; height = 0.88;
axes('position', [left top width height],'FontSize',14);
hold on;
linestyle = {'-','--','-.'};
for j=1:size(xout,1)
c = max(xout(j,:),0);
c = filter(1,[1 -0.99],c);
c = c(1:numChannels:end);
plot(t,c+2*(j-1),'k','LineStyle',linestyle{mod(j,3)+1});
end
set(gca,'Ytick',0:5:2*size(xout,1)-1);
% set(gca,'YTickLabel',[0:j-1]);
axis([0 2 -0.5 numChannels*2+5]);
ylabel('Filter Number','FontSize',14);
grid on;
for j=50:size(xout,1)
 sound(xout(j,:),Fs);
 pause(2);
end