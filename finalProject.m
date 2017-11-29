%% EE 107: Communication Systems, Fall 2017 - Final Project
clear all, close all
%% Image Pre-processing (from hw7)
qbits = 8;  % quantization bits
[Ztres,r,c,m,n,minval,maxval]=ImagePreProcess_gray('image_example.png',qbits);
% m is image number of rows 
% n is image number of columns
% minval, maxval to reverse linear scaling

%% Conversion to bit stream
% Transmit DCT blocks in groups of size N
N = m*n/64; %number of blocks to group together

% Convert to 3D array to the bitstream
stream = convertToBitStream(Ztres, N);

% Plot the frequency and time of the half sine and SRRC

% Half sine
T = 1;
t = linspace(0,T,32);
pulse_HS = sin(t*pi/T);

% Square root raised cosine
a = 0.5; % Roll off
K = 2; % Truncation Factor
t2 = linspace(-K*T,K*T,64*K); % New time vector
x = SRRC_x(a,t2,T); % x vals for SRRC
A = sqrt(sum(pulse_HS.^2)/sum(x.^2)); % Amplitude correction factor
pulse_SRRC = A*x; % SRRC pulse

% Plotting all that ish
figure
plot(t,pulse_HS);

figure
freqz(pulse_HS);

figure
plot(t2,pulse_SRRC);

figure
freqz(pulse_SRRC);

