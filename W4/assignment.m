%% assignment 1

N = 50; sigma = 5.0; tau = 2.0;

I  = double(imread('images/lena.tif'));
G1 = scale(N, sigma);
G2 = scale(N, tau);
G3 = abs(fftshift(ifft2(fft2(G1) .* fft2(G2))));
G4 = scale(N, sqrt(sigma^2.0 + tau^2.0));

colormap(jet);
subplot(1,2,1), imagesc(G3), axis image, title('convolved');
subplot(1,2,2), imagesc(G4), axis image, title('combined');

[x, y] = ginput(1);
x = uint8(x);
y = uint8(y);

G3(x,y)
G4(x-1,y-1)

%% assignment 2.b

clear all; clc;

syms x y t I(x,y)
G(x,y,t) = (1/2*pi*t^2) * exp(-(x^2 + y^2)/(2*t^2));

dx = diff(G, x, x);
dy = diff(G, y, y);

H = dx + dy;

S = solve([H, dx, dy], x, y, t);
[S.x, S.y, S.t]

%% assignment 4

I = double(imread('images/lena.tif'));
h = fspecial('gaussian', size(I), sigma);
n = rand(size(I)) .* 50;
g = conv2(I, h, 'same') + n;

colormap(gray);
subplot(1,1,1), imagesc(g), axis image;

%% assignment 5

N = 10; sigma = 5;
fq1 = 1e-6; fq2 = 1.0; fq3 = 0.2;

I = imread('images/lena.tif'); B = fft2(I); B = fftshift(B);
n = rand(size(I)) .* 100;
h = fspecial('gaussian', size(I), sigma);
H = psf2otf(h, size(h)); H = fftshift(H);
g = ifft2(H .* B); g = abs(g) + n;

% inverse, using a high frequency band-pass filter
G = fft2(g); G = fftshift(G);
indices = find(H > fq1);
F = zeros(size(G)); F(indices) = G(indices) ./ H(indices);
f = ifft2(F); f = abs(f);

% inverse, using a low frequency band-pass filter
J = fft2(g); J = fftshift(J);
indices = find(H > fq2);
F = zeros(size(J)); F(indices) = J(indices) ./ H(indices);
j = ifft2(F); j = abs(j);

% inverse, using a low frequency band-pass filter
K = fft2(g); K = fftshift(K);
indices = find(H > fq3);
F = zeros(size(J)); F(indices) = K(indices) ./ H(indices);
k = ifft2(F); k = abs(k);

colormap(gray);
subplot(1,3,1), imagesc(f), axis image, title('inverse (high band-pass)');
subplot(1,3,2), imagesc(j), axis image, title('inverse (low band-pass)');
subplot(1,3,3), imagesc(k), axis image, title('inverse (best result ~0.2)');

%% assignment 6

N = 10; sigma = 5;

I = imread('images/lena.tif');
FI = fft2(I); FI = fftshift(FI);
n = rand(size(I)) .* 50;
h = fspecial('gaussian', size(I), sigma);
H = psf2otf(h, size(h)); H = fftshift(H);
g = ifft2(H .* FI); g = abs(g) + n;

% taken from text book
NP    = abs(fftn(n)).^2;
NPOW  = sum(NP(:)) / prod(size(n));
NCORR = fftshift(real(fftn(NP)));

IP    = abs(fftn(I)).^2;
IPOW  = sum(IP(:)) / prod(size(I));
ICORR = fftshift(real(fftn(IP)));

NSR = sum(n(:).^2) / sum(I(:).^2);
NSR = NPOW ./ IPOW;

f = deconvwnr(g, h, NSR);
e = deconvwnr(g, h, NCORR, ICORR);

colormap(gray);
subplot(1,3,1), imagesc(g), axis image, title('noisy image');
subplot(1,3,2), imagesc(f), axis image, title('using noise ratio');
subplot(1,3,3), imagesc(e), axis image, title('using autocorrelations');
