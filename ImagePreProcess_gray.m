function [Ztres,r,c,m,n,minval,maxval]=ImagePreProcess_gray(filename,qbits)

% read the image

RGB = imread(filename);
X = rgb2gray(RGB);

% crop the image to a size divisible by 8
[m, n] = size(X);
m = m - mod(m,8);
n = n - mod(n,8);
X = X(1:m,1:n);

% convert the image to double
Z = im2double(X);

% This command will show all 3 layers of the colored image. 
figure;
imshow(Z);

%% take DCT in 8x8 blocks and quantize it into 8-bit or 16-bit numbers
fun = @dct2;
temp = blkproc(Z,[8 8],fun);
% scale DCT to [0,1]
minval = min(min(temp));
maxval = max(max(temp));
xformed = (temp-minval)/(maxval-minval);

% quantize DCT coefficients to 8 or 16 bits
if qbits == 8
   Zt=im2uint8(xformed);
elseif qbits == 16
   Zt=im2uint16(xformed);
end       

%%%%%%%%%% CONVERSION TO A BIT STREAM %%%%%%%%%%%%%%%%

%% reshape DCT into 8x8 blocks for ease of transmission
[m, n] = size(Zt);
r=floor(m/8); c=floor(n/8);
Ztres = reshape(permute(reshape(Zt,8,r,8,c), [1 3 2 4]), 8,8,r*c);
