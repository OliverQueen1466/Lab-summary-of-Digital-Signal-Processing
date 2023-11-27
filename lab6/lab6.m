exe3_3()

function exe1_1()
N = 8;    
k = linspace(0 , N -1, N) 
for n = 0 : N-1
    sum = cos((2 * n + 1) * k * pi./(2 * N))
    
    subplot(4,2,n+1),plot(k,sum)
end

end
function y = unfunction(x)
    if x > 0 
        y = 1
    else
        y = 0
       
    end 
end
function exe1_2()

for n = 0 : 8
    x(n + 1) = (0.8 ^ n) * cos(n * pi ./ 4) * (heaviside(n) -heaviside(n-8))
end
n = 0 : 1 : 8;
% plot(n,x)
% xlabel('n')
% ylabel('x[n]')
% a = dct(x)
% stem(a)
% xlabel('k')

stem(fft(x))
xlabel('k')
end

function exe1_3()
N = 8;    
k = linspace(0 , N -1, N) 
for n = 0 : N-1
    sum = (cos((2 * n + 1) * k * pi./(2 * N)) ) * ((0.8 ^ n) * cos(n * pi ./ 4) * (heaviside(n) -heaviside(n-8)))
    
    subplot(4,2,n+1),plot(k,sum)
end

end

function y = w_k(k,N)
    if k == 0
        y = (1./N)^(1/2)
    elseif k < N
        y = (2./N)^(1/2)
    end

end


function exe1_4()
N = 8;
for n = 0 : 7
    x(n + 1) = (0.8 ^ n) * cos(n * pi ./ 4) * (heaviside(n) -heaviside(n-8))
end

a = dct(x)
for n = 0 : 7
    sum = 0;
    for k = 0 : 3
        sum = sum + a(k+1) * cos((2 * n + 1) * k * pi ./ (2 * N))
    end
    y(n + 1) = w_k(n,N) * sum
end
sum_n = 0;
squared_norm = 0;
for n = 0 : 7
    sum_n = sum_n + (abs(x(n + 1)-y(n + 1))) ^ 2;
    squared_norm = squared_norm + (x(n + 1)) ^ 2;
end
 mse = sum_n ./ squared_norm

end

function exe2_1()
M = 8; N = 8; %define N and M
n = [0:N-1]; m = [0:M-1]; 
for k=0:M-1 
 for l=0:N-1
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%working as the equation(4)
 repmat(cos((2*m+1)*k*pi/(2*M))',1,N).* ...%treat w[k] as sqrt(2./N) first
 repmat(cos((2*n+1)*l*pi/(2*M)),M,1);%treat w[l] as sqrt(2./N) first
 if k==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ... %w[0] = sqrt(1 ./ N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 if l==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%w[0] = sqrt(1./N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);

 end
 end
end
basis = basis.*(sqrt(2/N)*sqrt(2/M));
basis = basis .* 50
basis = uint8(basis);
imagesc(basis)
colormap(gray(256))
end

function exe2_2()
M = 8; N = 8; %define N and M
n = [0:N-1]; m = [0:M-1]; 
for k=0:M-1 
 for l=0:N-1
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%working as the equation(4)
 repmat(cos((2*m+1)*k*pi/(2*M))',1,N).* ...%treat w[k] as sqrt(2./N) first
 repmat(cos((2*n+1)*l*pi/(2*M)),M,1);%treat w[l] as sqrt(2./N) first
 if k==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ... %w[0] = sqrt(1 ./ N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 if l==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%w[0] = sqrt(1./N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 end
end
basis = basis.*(sqrt(2/N)*sqrt(2/M)); % get the basis function
x = double(imread('barbaraLarge.gif')); %read the gif 
[r,c] = size(x);    % get the size of gif
X = zeros(r,c);     % create a zero matrix of the same size
for i=0:r/M-1       %acting as  i loop
 for j=0:c/N-1      %acting as j loop
 xb = x(i*M+1:(i+1)*M, j*N+1:(j+1)*N);% assign the matrix to xb
 for k=0:M-1
 for l=0:N-1
 X(i+k*(r/M)+1,j+l*(c/N)+1) = ...
sum(sum(xb.*basis(k*M+1:(k+1)*M,l*N+1:(l+1)*N)));% cimpute the xb with basis function
 end
 end
 end
end
XdB = 20*log10(abs(X)./max(max(abs(X))));% get the dB expression
XdBt = XdB + 60;
XdBt = max(XdBt,0);     %find the max in XdBt
f1 = figure('Position',[500 300 600 600],'Units','Normalized'); %create a figure
set(f1,'PaperPosition',[0.25 1.5 8 8]); % set the graphic object property
axes('Position',[0.09 0.09 0.88 0.88]);% Create Cartesian axes
imagesc([0:c-1],[0:r-1],XdBt); %Display image with scaled 
cmap = colormap('gray');%View and set current colormap to gray
colormap(flipud(cmap)); %Flip array up to down
set(gca,'XTick',[0:c/N:c],'YTick',[0:r/M:r]); % set the graphic object property
set(gca,'XTickLabel','','YTickLabel',''); %set the graphic object property
grid on; set(gca,'GridLineStyle','-');%Display or hide axes grid lines
axis equal;
for k=0:M-1
    text(-40,k*r/M+r/M/2,['k = ' num2str(k)],'FontSize',14);% Add text descriptions to data points using the size of 14
end
for l=0:M-1
 text(l*c/M+c/N/4,r+15,['l = ' num2str(l)],'FontSize',14); %dd text descriptions to data points using the size of 14
end
kv = [0 1 2 3 4 5 6 7 ];% create a array for loop for row
lv = [0 1 2 3 4 5 6 7 ];% crete a array for loop for column
xr = zeros(fix(2 * M * r ./ ((M - 1) * 2)),fix(2 * M * c ./ ((M - 1)*2))); % create  a zero array
for k=kv
 for l=lv
 Xb = X(k*r/M+1:(k+1)*r/M, l*c/N+1:(l+1)*c/N); % assign the vlue to xb
 for i=0:r/M-1
 for j=0:c/N-1
 xr(i*M+1:i*M+M,j*N+1:j*N+N) = ...% compute the value and assig the value to xr
xr(i*M+1:i*M+M,j*N+1:j*N+N) + ...
 Xb(i+1,j+1)*basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N);
 end
 end
 end
end
imagesc(xr)
end

function exe3_1()
M = 8; N = 8; %define N and M
n = [0:N-1]; m = [0:M-1]; 
for k=0:M-1 
 for l=0:N-1
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%working as the equation(4)
 repmat(cos((2*m+1)*k*pi/(2*M))',1,N).* ...%treat w[k] as sqrt(2./N) first
 repmat(cos((2*n+1)*l*pi/(2*M)),M,1);%treat w[l] as sqrt(2./N) first
 if k==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ... %w[0] = sqrt(1 ./ N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 if l==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%w[0] = sqrt(1./N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 end
end
basis = basis.*(sqrt(2/N)*sqrt(2/M)); % get the basis function
x = double(imread('bridge.gif')); %read the gif 
[r,c] = size(x);    % get the size of gif
X = zeros(r,c);     % create a zero matrix of the same size
for i=0:r/M-1       %acting as  i loop
 for j=0:c/N-1      %acting as j loop
 xb = x(i*M+1:(i+1)*M, j*N+1:(j+1)*N);% assign the matrix to xb
 for k=0:M-1
 for l=0:N-1
 X(i+k*(r/M)+1,j+l*(c/N)+1) = ...
sum(sum(xb.*basis(k*M+1:(k+1)*M,l*N+1:(l+1)*N)));% cimpute the xb with basis function
 end
 end
 end
end
XdB = 20*log10(abs(X)./max(max(abs(X))));% get the dB expression
XdBt = XdB + 60;
XdBt = max(XdBt,0);     %find the max in XdBt
f1 = figure('Position',[500 300 600 600],'Units','Normalized'); %create a figure
set(f1,'PaperPosition',[0.25 1.5 8 8]); % set the graphic object property
axes('Position',[0.09 0.09 0.88 0.88]);% Create Cartesian axes
imagesc([0:c-1],[0:r-1],XdBt); %Display image with scaled 
cmap = colormap('gray');%View and set current colormap to gray
colormap(flipud(cmap)); %Flip array up to down
set(gca,'XTick',[0:c/N:c],'YTick',[0:r/M:r]); % set the graphic object property
set(gca,'XTickLabel','','YTickLabel',''); %set the graphic object property
grid on; set(gca,'GridLineStyle','-');%Display or hide axes grid lines
axis equal;
for k=0:M-1
    text(-40,k*r/M+r/M/2,['k = ' num2str(k)],'FontSize',14);% Add text descriptions to data points using the size of 14
end
for l=0:M-1
 text(l*c/M+c/N/4,r+15,['l = ' num2str(l)],'FontSize',14); %dd text descriptions to data points using the size of 14
end
end

function exe3_3()
M = 8; N = 8; %define N and M
n = [0:N-1]; m = [0:M-1]; 
for k=0:M-1 
 for l=0:N-1
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%working as the equation(4)
 repmat(cos((2*m+1)*k*pi/(2*M))',1,N).* ...%treat w[k] as sqrt(2./N) first
 repmat(cos((2*n+1)*l*pi/(2*M)),M,1);%treat w[l] as sqrt(2./N) first
 if k==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ... %w[0] = sqrt(1 ./ N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 if l==0
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N) = ...%w[0] = sqrt(1./N)
 basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N)./sqrt(2);
 end
 end
end
basis = basis.*(sqrt(2/N)*sqrt(2/M)); % get the basis function
x = double(imread('bridge.gif')); %read the gif 
[r,c] = size(x);    % get the size of gif
X = zeros(r,c);     % create a zero matrix of the same size
for i=0:r/M-1       %acting as  i loop
 for j=0:c/N-1      %acting as j loop
 xb = x(i*M+1:(i+1)*M, j*N+1:(j+1)*N);% assign the matrix to xb
 for k=0:M-1
 for l=0:N-1
 X(i+k*(r/M)+1,j+l*(c/N)+1) = ...
sum(sum(xb.*basis(k*M+1:(k+1)*M,l*N+1:(l+1)*N)));% cimpute the xb with basis function
 end
 end
 end
end
XdB = 20*log10(abs(X)./max(max(abs(X))));% get the dB expression
XdBt = XdB + 60;
XdBt = max(XdBt,0);     %find the max in XdBt
f1 = figure('Position',[500 300 600 600],'Units','Normalized'); %create a figure
set(f1,'PaperPosition',[0.25 1.5 8 8]); % set the graphic object property
axes('Position',[0.09 0.09 0.88 0.88]);% Create Cartesian axes
imagesc([0:c-1],[0:r-1],XdBt); %Display image with scaled 
cmap = colormap('gray');%View and set current colormap to gray
colormap(flipud(cmap)); %Flip array up to down
set(gca,'XTick',[0:c/N:c],'YTick',[0:r/M:r]); % set the graphic object property
set(gca,'XTickLabel','','YTickLabel',''); %set the graphic object property
grid on; set(gca,'GridLineStyle','-');%Display or hide axes grid lines
axis equal;
for k=0:M-1
    text(-40,k*r/M+r/M/2,['k = ' num2str(k)],'FontSize',14);% Add text descriptions to data points using the size of 14
end
for l=0:M-1
 text(l*c/M+c/N/4,r+15,['l = ' num2str(l)],'FontSize',14); %dd text descriptions to data points using the size of 14
end
kv = [0 1 2 3  ];% create a array for loop for row
lv = [0 1 2 3  ];% crete a array for loop for column
xr = zeros(fix( M * r ./ (M - 1)),fix(M * c ./ (M - 1))); % create  a zero array
for k=kv
 for l=lv
 Xb = X(k*r/M+1:(k+1)*r/M, l*c/N+1:(l+1)*c/N); % assign the vlue to xb
 for i=0:r/M-1
 for j=0:c/N-1
 xr(i*M+1:i*M+M,j*N+1:j*N+N) = ...% compute the value and assig the value to xr
xr(i*M+1:i*M+M,j*N+1:j*N+N) + ...
 Xb(i+1,j+1)*basis(k*M+1:(k+1)*M, l*N+1:(l+1)*N);
 end
 end
 end
end
imagesc(xr)
end




