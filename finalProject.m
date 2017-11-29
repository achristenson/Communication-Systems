%% EE 107: Communication Systems, Fall 2017 - Final Project
% 

clear all, close all
%% Image Pre-processing (from hw7)
qbits = 8;  % quantization bits
[Ztres,r,c,m,n,minval,maxval]=ImagePreProcess_gray(filename,qbits);
% m is image number of rows 
% n is image number of columns
% minval, maxval to reverse linear scaling

B_3d = reshape(B, [8 8 m*n/64]); %reshaped 3D matrix of DCT blocks

%% Conversion to bit stream
% Transmit DCT blocks in groups of size N
N = m*n/64; %number of blocks to group together
%B_3d = round(B_3d);    CANNOT CONVERT non integers to binary, round?
stream = convertToBitStream(B_3d, N);
data = convertFromBitStream(stream,N);
