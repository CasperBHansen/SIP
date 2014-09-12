%% assignment 1.3

I = imread('images/pout.tif');
graph = histcum(I);

figure (1);
subplot(1,3,1), imshow(I), axis image;
subplot(1,3,2), bar(imhist(I)), axis on;
subplot(1,3,3), bar(graph), axis on;

%% assignment 1.4

I = imread('images/pout.tif');
cdf = histcum(I);
FI = fpimg(I, cdf);
imagesc(FI), axis image;
colormap(jet);

%% assignment 1.5

I = imread('images/pout.tif');
cdf = histcum(I);
finv(cdf, 0.5);

%% assignment 1.6

I = rgb2grey(imread('images/cola1.png'));
T = rgb2grey(imread('images/cola2.png'));
R = histmatch(I, T);

subplot(2,3,1), imshow(I), axis image, title('original');
subplot(2,3,2), imshow(T), axis image, title('target');
subplot(2,3,3), imshow(R), axis image, title('result');

subplot(2,3,4), bar(imhist(I)), axis tight, title('original (histogram)');
subplot(2,3,5), bar(imhist(T)), axis tight, title('target (histogram)');
subplot(2,3,6), bar(imhist(R)), axis tight, title('result (histogram)');

%% assignment 1.7

H = arrayfun( @(x) (1/256), 0:255);
CH = arrayfun( @(x) x * (1/255), 0:255);

I = imread('images/pout.tif');
R1 = histmatch(I, CH);
R2 = histeq(I, H);

subplot(1,3,1), imshow(I), axis image, title('original');
subplot(1,3,2), imshow(R1), axis image, title('histmatch');
subplot(1,3,3), imshow(R2), axis image, title('histeq');

%% assignment 1.9

I1 = rgb2grey(imread('images/movie_flicker1.tif'));
I2 = rgb2grey(imread('images/movie_flicker2.tif'));
M = midway(I1, I2);

R1 = histeq(I1, M);
R2 = histeq(I2, M);

subplot(2,2,1), imagesc(I1), axis image, title('1st, original');
subplot(2,2,2), imagesc(I2), axis image, title('2nd, original');
subplot(2,2,3), imagesc(R1), axis image, title('1st, midway');
subplot(2,2,4), imagesc(R2), axis image, title('2nd, midway');
colormap(gray);
