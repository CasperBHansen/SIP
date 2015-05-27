%
% Experiments on Translations
% fvx507@alumni.ku.dk
%

%% assignment 1.1

clc, clear all;

H = [0 0 0;
     1 0 0;
     0 0 0];

I = double(imread('images/cameraman.jpg'));
[M,N] = size(I);
R = imfilter(I, H);

colormap(gray);
subplot(1,2,1), imagesc(I), axis image, axis off, title('original');
subplot(1,2,2), imagesc(R), axis image, axis off, title('filtered');

%% assignment 1.2

clc, clear all;

N = 25;
C = ceil(N/2);
I = zeros([N N]);
I(C, C) = 1;
R = translate(I, [8 5]);

colormap(gray);
subplot(1,2,1), imagesc(I), axis image, axis off, title('original');
subplot(1,2,2), imagesc(R), axis image, axis off, title('translated');

%% assignment 1.3

clc, clear all;

N = 7;
C = ceil(N/2);
I = zeros([N N]);
I(C, C) = 1;
[M,N] = size(I);

H = fftshift(fft2(I));
x = 2; y = 1;

% define shift in frequency domain
[u, v] = meshgrid((-M/2):(M/2-1),(-N/2):(N/2-1));

% perform the shift
H = H .* exp(-i*2*pi.*(u*x+v*y)/M);
IF = ifft2(ifftshift(H));

colormap(gray);
subplot(1,2,1), imagesc(I), axis image, axis off, title('original');
subplot(1,2,2), imagesc(abs(IF)), axis image, axis off, title('translated');

%% assignment 1.4

clc, clear all;

N = 7;
C = ceil(N/2);
I1 = zeros([N N]);
I1(C, C) = 1;
I2 = peaks(25);
[M1,N1] = size(I1);
[M2,N2] = size(I2);

x = 1.5; y = 0.5;

% fourier transforms
H1 = fftshift(fft2(I1));
H2 = fftshift(fft2(I2));

% define shift in frequency domains
[u1, v1] = meshgrid((-M1/2):(M1/2-1),(-N1/2):(N1/2-1));
[u2, v2] = meshgrid((-M2/2):(M2/2-1),(-N2/2):(N2/2-1));

% perform the shift
H1 = H1 .* exp(-i*2*pi.*(u1*x+v1*y)/M1);
H2 = H2 .* exp(-i*2*pi.*(u2*x+v2*y)/M2);
IF1 = ifft2(ifftshift(H1));
IF2 = ifft2(ifftshift(H2));

colormap(gray);
subplot(2,2,1), imagesc(I1), axis image, axis off, title('original square');
subplot(2,2,2), imagesc(abs(IF1)), axis image, axis off, title('translated square');
subplot(2,2,3), imagesc(I2), axis image, axis off, title('original image');
subplot(2,2,4), imagesc(abs(IF2)), axis image, axis off, title('translated image');
