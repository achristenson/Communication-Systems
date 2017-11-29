%% EE 107: Communication Systems, Fall 2017 - Final Project
% 

clear all, close all
%% Image Pre-processing (from hw7)
load trees
Z = ind2gray(X(1:200,1:200), gray); %convert to grayscale
m = size(Z,1);  %number of rows
n = size(Z,2);  %number of columns
figure
subplot(2,2,1)
imshow(Z);  %plot image
title('Imported image')
avg_power = (1/numel(Z)) * sum(sum(Z^2));   %average signal power
fun = @(x) dct2(x.data);
fun2 = @(y) idct2(y.data); 

B = blockproc(Z,[8 8],fun); %take DCT of 8x8 blocks of data 
minB = min(min(B));
B = B - minB;       %scale linearly so that minB -> 0
maxB = max(max(B));
B = B / maxB;       %   and maxB ->1 

B_3d = reshape(B, [8 8 m*n/64]); %reshaped 3D matrix of DCT blocks

%% Conversion to bit stream
% Transmit DCT blocks in groups of size N
N = m*n/64; %number of blocks to group together
%B_3d = round(B_3d);    CANNOT CONVERT non integers to binary, round?
stream = convertToBitStream(B_3d, N);
data = convertFromBitStream(stream,N);
