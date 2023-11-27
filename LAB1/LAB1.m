% [data, count] = readbuoydata('045200603.txt');
% origdata = data.Hs;
% % plot(data.Hs)
% datetick('x',19,'keeplimits');
% xlabel('Time')
% ylabel('Significant Wave Height (m)')
% plot(data.Tp)
% datetick('x',19,'keeplimits');
% xlabel('Time')
% ylabel('Peak Period')
% global strings Hs;
% global strings Tp;
% % ave_Tp(51,data.Hs);
% ave_Hs_improved(51,data.Hs)
% avedata = Hs;
% plot(origdata,'Color',[0.8 0.8 0.8], 'LineWidth',2);
% hold on;
% plot(avedata,'k');
% plot(data.Tp)
% xlabel('Time')
% ylabel('Significant Wave Height (m)')
% title('M=51')
global DA2D;
global out1;
DA2D = zeros(512);
I = imread('boat.gif');
% imshow(I)
ace_2D(7,I);
ace_2DY(7,DA2D);
A = im2uint8(mat2gray(out1));
imshow(A)

% im2uint8(out1);
% imshow(out1)
% imshow(I)
% imshow(DA2D);
function ave_Tp(M,data) % moving average that has delay
global strings Hs;
   
    for i = 1 : M-1
        data = [0 data];
    end
    for i = M : length(data)
        sum = 0;
        for j = 0 : M-1
        sum = sum + data(i-j);
        Hs(i-j) = (sum)/M;
        end
    end

end
function [data, count] = readbuoydata(datafile) % read the file
fid = fopen(datafile,'r');
tline = fgetl(fid);
tline = fgetl(fid);
[A,count] = fscanf(fid,'%d %d %d %d %d %f %f %d %f %f',[10 inf]);
data.date = datenum([A(1:5,:); zeros(1,size(A,2))]')';
data.Hs = A(6,:); % significant wave height
data.Tp = A(7,:); % peak period
data.Dp = A(8,:); % peak period direction
data.Ta = A(9,:); % average period
data.SST = A(10,:); % sea surface temperature
fclose(fid);
end
function ave_Hs_improved(M,data) % zero delay moving average
global strings Hs;
   
    for i = 1 : (M-1)/2
        data = [0 data];
    end
    for i = 1 : (M-1)/2
        data = [data 0];
    end
    for i = (M-1)/2 : length(data)-(M-1)/2
        sum = 0;
        for j = -(M-1)/2 : (M-1)/2-1
        sum = sum + data(i-j);
        Hs(i-j) = (sum)/M;
        end
    end

end
function ace_2D(M,data) %2-D moving average for rows
    global DA2D;
    global out1;
    X = zeros(512,1,'uint32');
     for i = 1 : (M-1)/2
        data = [X data];
    end
    for i = 1 : (M-1)/2
        data = [data X];
    end
    for i = (M-1)/2 + 1 : 512+(M-1)/2
        sum = 0;
        for j = -(M-1)/2 : (M-1)/2
            sum = sum + data(:,i-j);
%             display(sum(1));
        end

        DA2D(:,i-(M-1)/2) = (sum)./M;
    end
   
end
function ace_2DY(M,data) % 2-D moving averarge for columns
global DA2D;
global out1;
  Y = zeros(1,512,'uint32');
     for i = 1 : (M-1)/2
        DA2D = [Y ; data];
    end
    for i = 1 : (M-1)/2
        DA2D = [DA2D ; Y];
    end
    for i = (M-1)/2 + 1: 512-(M-1)/2
        sum = 0;
        for j = -(M-1)/2 : (M-1)/2
            sum = sum + DA2D(i-j,:);
           
        end 
        out1(i-(M-1)/2,:) = (sum)./M;
    end

end