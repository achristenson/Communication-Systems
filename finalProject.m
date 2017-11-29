%% EE 107: Communication Systems, Fall 2017 - Final Project
% 

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
plot_half_sine_wave();
plot_SRRC();



%data = convertFromBitStream(stream,N);
