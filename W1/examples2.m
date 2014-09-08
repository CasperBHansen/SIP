%% example 2.1

close all; clc;

f = ones(64,1); f./sum(f);      % define rectangle signal f and normalize
g = conv(f,f); g = g./sum(g);   % convolve f with itself and normalize
h = conv(g,g); h = h./sum(h);   % convolve g with itself and normalize
j = conv(h,h); j = j./sum(j);   % convolve h with itself and normalize

subplot(2,2,1),plot(f,'k-'); axis square; axis off;
subplot(2,2,2),plot(f,'k-'); axis square; axis off;
subplot(2,2,3),plot(f,'k-'); axis square; axis off;
subplot(2,2,4),plot(f,'k-'); axis square; axis off;

%% example 2.2

close all; clc;

A = imread('images/trui.png');          % load image
PSF = fspecial('gaussian', [5 5], 2);   % gaussian convolution kernel
h = fspecial('motion', 10, 45);         % motion filter
B = conv2(PSF, double(A));              % convolve image with convolution kernel
C = imfilter(A, h, 'replicate');        % convolve motion PSF using alt. function
D = conv2(double(A), double(A));        % self-convolution - motion-blurred

subplot(1,3,1), imshow(A);              % display original
subplot(1,3,2), imshow(B, []);          % display filtered image
subplot(1,3,3), imshow(C, []);          % display filtered image

