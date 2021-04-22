%% Simulation for force channel
clear all; close all; clc;

%% zero at target (vertical channel)
x = 0:0.01:30;
y = 0:0.01:30;
tx = 15;
ty = y;
Fo = 800;  % Max force
w = 0.5;   % Channel width = 2*w
kx = Fo./abs(x-tx);
itx = round(tx*length(x)/(x(end)-x(1))); 
iw1 = round((tx-w)*length(x)/(x(end)-x(1)));
iw2 = round((tx+w)*length(x)/(x(end)-x(1)));
kx(iw1+1:iw2) = 0;
ky = 0;
fx = kx.*abs(x-tx);
fy = ky.*abs(y-ty);
subplot(2,2,1)
plot(x,fx, 'r');
hold on
plot(y,fy, 'g');
title('Zero force inside channel width')
xlabel('x-position')
ylabel('Force')
subplot(2,2,2)
plot(x(iw1-5:iw2+5),fx(iw1-5:iw2+5), 'r');
title('Zoom channel')
xlabel('x-position')
ylabel('Force')
% axis([0 30 0 160])

%% exp decay at target (vertical target)
x = 0:0.01:30;
y = 0:0.01:30;
tx = 15;
ty = y;
Fo = 800;  % Max force
w = 0.5;   % Channel width = 2*w
kx = Fo./abs(x-tx);
itx = round(tx*length(x)/(x(end)-x(1))); 
iw1 = round((tx-w)*length(x)/(x(end)-x(1)));
iw2 = round((tx+w)*length(x)/(x(end)-x(1)));
tempx = tx-w;
for ix = iw1+1:iw2
    kx(ix) = exp(abs(tempx-tx)*log(Fo/w)/w);
    tempx = tempx+0.01;
end
ky = 0;
fx = kx.*abs(x-tx);
fy = ky.*abs(y-ty);
subplot(2,2,3)
plot(x,fx, 'r');
hold on
plot(y,fy, 'g');
title('Exponential decay inside channel width')
xlabel('x-position')
ylabel('Force')
subplot(2,2,4)
plot(x(iw1-5:iw2+5),fx(iw1-5:iw2+5), 'r');
title('Zoom channel')
xlabel('x-position')
ylabel('Force')
