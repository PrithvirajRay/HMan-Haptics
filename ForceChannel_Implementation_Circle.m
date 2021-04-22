%%  _____ Clear the workspace of matlab _____

clear all; close all; clc; %#ok<CLALL>

%% _____ Variable declaration _____
% Declare global variables to load DLL files.
global Articares
global Log

%% _____ Add path of H-Man code files _____
addpath('H-Man_codes')

%% _____ Load DLL files ______
% This will call the function to load the Articares.Core and NLog DLL files
% from a folder called lib in same location as this code.

[Articares, Log] = LoadDLL();

%% _____ Connect to H-Man _____
% This will call the function to connect to H-Man on the IP 192.168.102.1
% and will return the handle to the connection in the variable named instance.

global instance
instance = ConnectHMan();

%% _____ Set force channel (Zero force inside channel) _____

%ask input for radius of circle r & declare a variable o for angle

while 1
    tx = r*cos(o);
    ty = r*sin(o);
    
    % ___ Add code line to set target at (tx,ty) ____
    
    x = instance.current_x;
    y = instance.current_y;
    kx = 150./abs(x-tx);
    tx = 15;
    ty = y;
    Fo = 800;  % Max force
    w = 0.5;   % Channel width = 2*w
    kx = Fo./abs(x-tx);
    if x>tx-w && x<tx+w
        kx = 0;
    end
    instance.SetTarget("STIFFNESSX", num2str(kx))
end
