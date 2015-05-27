%% assignment 1

I1 = imread('images/box.png');
I2 = imread('images/mir.tif');
R1 = sinogram(I1, 180);
R2 = sinogram(I2, 180);

figure (1), colormap(bone);
subplot(1,4,1), imagesc(I1), axis image, title('original (box.png)');
subplot(1,4,2), imagesc(R1), axis image, title('sinogram (box.png)');
subplot(1,4,3), imagesc(I2), axis image, title('original (mir.png)');
subplot(1,4,4), imagesc(R2), axis image, title('sinogram (mir.png)');

%% assignment 2

M = 128;

% make sinograms
S1 = sinogram(imread('images/box.png'), M);
S2 = sinogram(imread('images/mir.tif'), M);
S3 = imrotate(imread('images/sinogram.png'), 90, 'bilinear');

% make reconstructions
R1 = imrotate(backprojection(double(S1), M), -90, 'bilinear');
R2 = imrotate(backprojection(double(S2), M), -90, 'bilinear');
R3 = backprojection(double(S3), size(S3,2));

figure (1), colormap(bone);
subplot(1,3,1), imagesc(S1), axis image, axis off, title('sinogram of box.png');
subplot(1,3,2), imagesc(S2), axis image, axis off, title('sinogram of mir.tif');
subplot(1,3,3), imagesc(S3), axis image, axis off, title('sinogram.png');

figure (2), colormap(bone);
subplot(1,3,1), imagesc(R1), axis image, axis off, title('reconstruction of box.png');
subplot(1,3,2), imagesc(R2), axis image, axis off, title('reconstruction of mir.tif');
subplot(1,3,3), imagesc(R3), axis image, axis off, title('reconstruction of sinogram.png');

%% assignment 3

M = 128;

% make sinograms
S1 = sinogram(imread('images/box.png'), M);
S2 = sinogram(imread('images/mir.tif'), M);
S3 = imrotate(imread('images/sinogram.png'), 90, 'bilinear');

% make reconstructions
F1 = backprojection(double(S1), size(S1,2), [floor(size(S1,1)/2):-1:0 1:ceil(size(S1,1)/2-1)]');
F2 = backprojection(double(S2), size(S2,2), [floor(size(S2,1)/2):-1:0 1:ceil(size(S2,1)/2-1)]');
F3 = backprojection(double(S3), size(S3,2), [floor(size(S3,1)/2):-1:0 1:ceil(size(S3,1)/2-1)]');

figure (1), colormap(bone);
subplot(1,3,1), imagesc(S1), axis image, axis off, title('sinogram of box.png');
subplot(1,3,2), imagesc(S2), axis image, axis off, title('sinogram of mir.tif');
subplot(1,3,3), imagesc(S3), axis image, axis off, title('sinogram.png');

figure (2), colormap(bone);
subplot(1,3,1), imagesc(F1), axis image, axis off, title('reconstruction of box.png');
subplot(1,3,2), imagesc(F2), axis image, axis off, title('reconstruction of mir.tif');
subplot(1,3,3), imagesc(F3), axis image, axis off, title('reconstruction of sinogram.png');

%% assignment 4

clc, clear all;

img = 'images/box.png';

% plot
S = cell(5);
R = cell(5);
for i = 1:5
    M = 2^i;
    S{i} = sinogram(imread(img), M);
    H = [floor(size(S{i},1)/2):-1:0 1:ceil(size(S{i},1)/2-1)]';
    R{i} = backprojection(double(S{i}), size(S{i},2), H);
end

% plot
colormap('bone');
for i = 1:5
    clear t;
    t = strcat('sinogram (M=', int2str(2^i), ')');
    subplot(2,5,i), imagesc(S{i}), axis off, title(t);
end

for i = 1:5
    clear t;
    t = strcat('reconstruction (M=', int2str(2^i), ')');
    subplot(2,5,i+5), imagesc(R{i}), axis image, axis off, title(t);
end