function exe1_5()
y = imread('barbaraLarge.gif'); % import the image
L = 4;  % set the value of L
[rows,columns] = size(y); % get the size of rows and columns
yd = zeros(floor(rows/L),floor(columns/L)); % create the vector
for i=1:floor(rows/L)       % do the downsample by rows
 for j=1:floor(columns/L)  %do the downsample by columns
 yd(i,j) = y((i-1)*L+1, (j-1)*L+1); 
 end
end
figure('Position',[100 100 size(y,2) size(y,1)], ...% some settings for the figure
 'MenuBar', 'none', 'PaperPosition',[0.25 1.5 5 5]);
axes('Position',[0 0 1 1]); %set the axis of x and y 
imagesc(yd); %show the image
title('L = 2')
colormap('gray');