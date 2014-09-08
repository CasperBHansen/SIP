%
% Signal & Image Processing
% Assignment, week 1
% Casper B. Hansen, fvx507
%

%% assignment 1.1

figure(1);                              % start figure 1
img = rand(20);                         % generate greyscale image
imshow(img), imagesc(img);              % show and scale the image
axis image, xlabel('X'); ylabel('Y');   % set x and y axis labels

[y, x] = ginput(1);                     % take cursor input
img(uint8(x), uint8(y)) = 0;            % read position, set it to black

imshow(img), imagesc(img);              % show and scale the image
axis image, xlabel('X'); ylabel('Y');   % set x and y axis labels
clear all;                              % fixes title rewrite bug

%% assignment 1.2

img = imread('images/cell.tif');

subplot(1,3,1), imshow(img), title('imshow');
subplot(1,3,2), image(img), title('image');
subplot(1,3,3), imagesc(img), title('imagesc');
colormap(jet);

%% assignment 1.3

img = imread('images/cameraman.tif');   % read in grey-scale image

for bit = 1:8                               % loop through bits 1-8
    plane = bitget(img, bit);               % get bit plane at current
    subplot(2, 4, bit), imshow(plane, []);  % subplot current bit plane
    title(strcat('Bit', num2str(bit)))      % add title
end

%% assignment 1.4

img = imread('Profile.jpg');    % read in RGB image
hsv = rgb2hsv(img);
components = ['H', 'S', 'V'];   % define component array 

subplot(1,5,1), imshow(img); axis image; title('RGB');  % plot RGB
subplot(1,5,2), imshow(hsv); axis image; title('HSV');  % plot HSV
for c = 1:3
    subplot(1,5,c+2), imshow(hsv(:,:,c));               % plot component
    title(components(c));                               % component title
end

%% assignment 1.5

img = imread('Profile.jpg');        % read in RGB image

figure (1);      % figure 1, scaling
low = imresize(img, 0.1);           % scale by 0.08
squeeze = imresize(img, [64 128]);  % squeezed y-axis
upscale = imresize(low, 10);        % upscaled

subplot(1,3,1), imshow(low); axis image; title('Low Resolution');
subplot(1,3,2), imshow(squeeze); axis image; title('Squeezed');
subplot(1,3,3), imshow(upscale); axis image; title('Up-scaled');

figure (2);     % figure 1, interpolation
tic, nearest  = imresize(low, 10, 'nearest'); toc   % 6.830 ms
tic, bilinear = imresize(low, 10, 'bilinear'); toc  % 21.617 ms
tic, bicubic  = imresize(low, 10, 'bicubic'); toc   % 40.825 ms

subplot(1,3,1), imshow(nearest); axis image; title('Nearest');
subplot(1,3,2), imshow(bilinear); axis image; title('Bilinear');
subplot(1,3,3), imshow(bicubic); axis image; title('Bicubic');

%% assignment 1.6

img = imread('images/railway.png');     % read in an image
imfinfo('images/railway.png')
imtool(img)

%% assignment 1.7

A = imread('images/rice.png');
B = imread('images/cameraman.tif');
C = imadd(A, B); D = imadd(A, B, 'uint16');
E = imsubtract(A, B);

subplot(1,3,1), imagesc(C), axis image, title('imadd 8-bit');
subplot(1,3,2), imagesc(D), axis image, title('imadd 16-bit');
subplot(1,3,3), imagesc(E), axis image, title('imsubtract');

%% assignment 1.8

A = cell(1,10);
B = cell(1,9);

for i = 1:10
    if i < 10
        A{i} = imread(strcat('images/AT3_1m4_0', num2str(i), '.tif'))
    else
        A{i} = imread(strcat('images/AT3_1m4_', num2str(i), '.tif'))
    end
end

for i = 1:9
    img = imabsdiff(A{i}, A{i+1});
    subplot(2,5,i), imagesc(img), axis image;
end

%% assignment 1.9

A = imread('images/rice.png');
B = imread('images/cameraman.tif');
C = blend(A, B, 0.25, 0.75);

imshow(C), axis image;
