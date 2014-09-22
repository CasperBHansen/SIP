%% assignment 2.a

I = double(imread('images/lena.tif'));
P = abs(fftn(I)).^2;
R = fftshift(real(ifftn(P)));

figure (1);
colormap(gray);
imagesc(I);

figure (2);
colormap(jet);
imagesc(R);

%% assignment 2.b

I1 = double(imread('images/lena.tif'));
I2 = [512 512];

h = [1 2 1; 0 0 0; -1 -2 -1];

% for-loop convolution
tic;
for x = 2:511
    for y = 2:511
        m = [I1(x - 1, y - 1)    I1(x, y - 1)     I1(x + 1, y - 1);
             I1(x - 1, y)        I1(x, y)         I1(x + 1, y);
             I1(x - 1, y + 1)    I1(x, y + 1)     I1(x + 1, y + 1)];
        M = m * h;
        I2(x,y) = M(2,2);
    end
end
for_t = toc;

tic;
I3 = ifft2( fft2(I1) .* freqz2(h, [512 512]) );
fft_t = toc;

colormap(gray);
subplot(1,3,1), imagesc(I1), axis image, title('original');
subplot(1,3,2), imagesc(I2), axis image, title('for-loop');
subplot(1,3,3), imagesc(I3), axis image, title('FFT');

for_t
fft_t

%% assignment 2.c

clear all;

a = 25;
v = 6;
w = 3;

I = double(imread('images/lena.tif'));
I1 = someFunc(I, a, v, w);

h = [0 0 0;
     0 1 0;
     0 0 0];
h = h .* a;

for x = 2:511
    for y = 2:511
        I2(x,y) = I1(x,y) - a * cos(v*x + w*y); % works, but isn't a kernel
%         m = [I1(x - 1, y - 1)    I1(x, y - 1)     I1(x + 1, y - 1);
%              I1(x - 1, y)        I1(x, y)         I1(x + 1, y);
%              I1(x - 1, y + 1)    I1(x, y + 1)     I1(x + 1, y + 1)];
%         M = m * h;
%         I2(x,y) = M(2,2);
    end
end

P = abs(fftn(double(I1))).^2;
POW = fftshift(real(ifftn(P)));

colormap(gray);
subplot(1,3,1), imagesc(I1), title('noise image');
subplot(1,3,2), imagesc(I2), title('filtered');
subplot(1,3,3), imagesc(POW), title('power spectrum');

%% assignment 2.d

I = imread('images/lena.tif');
R1 = scale(I, 5);
R2 = scale(I, 10);
R3 = scale(I, 15);

colormap(gray);
subplot(1,4,1), imagesc(I), axis image, title('original');
subplot(1,4,2), imagesc(abs(R1)), axis image, title('x5 scale');
subplot(1,4,3), imagesc(abs(R2)), axis image, title('x10 scale');
subplot(1,4,4), imagesc(abs(R3)), axis image, title('x15 scale');

%% assignment 2.f

% TODO
