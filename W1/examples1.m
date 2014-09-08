%% example 1.1

imfinfo('images/cameraman.tif');                % get the image info
img = imread('images/cameraman.tif');           % read the image
imwrite(img, 'images/cameraman.jpg', 'jpg');    % save the image as jpg
imfinfo('images/cameraman.jpg');                % get the new image info

% Q: Where is the jpeg save?
% A: In the working directory

% Q: What coding method was used to save the JPEG file?
% A: Huffman algorithm

% Q: Why is the file size different for the PNG and JPEG files?
% A: Because the Huffman encoding is a more efficient compression method

close all

%% example 1.2
img = imread('images/cameraman.tif');   % generate random image from 0-1000
imshow(img);                            % first show the image
imagesc(img);                           % next, display image using imagesc
axis image;
axis off;
colormap(gray);

close all

%% example 1.3

img = rand(256).*1000;             % generate random image from 0-1000
imshow(img);                       % poor contrast because exceeds range
imagesc(img);                      % scale the colormap to range
axis image;
axis off;

colormap(gray);                    % set the colormap
colorbar;                          % show color bar

close all

%% example 1.4

A = imread('cell.tif');         % read in 8-bit intensity image
B = imread('spine.tif');        % read in 8-bit intensity image
C = imread('onion.png');        % read in 8-bit color image

subplot(1,3,1);                 
imagesc(A);
axis image;
axis off;
colormap(gray);

subplot(1,3,2);
imagesc(B);
axis off;

subplot(1,3,3);
imshow(C);
colormap(jet);

% notice a difference in how the images scale with window

close all

%% example 1.5

A = imread('cell.tif');         % read in 8-bit intensity image
%imtool(A);                      % use cursor to examine image

B = imread('onion.png');        % read in 8-bit intensity image
% imtool(B);                      % use cursor to examine image

A(25, 50)                       % print pixel at (25, 50)
A(25, 50) = 255;                % set pixel at (25, 50)
imshow(A);                      % view resulting changes

B(25, 50, :)                    % print RGB pixel at (25, 50)
B(25, 50, 1)                    % print first component at (25, 50)
B(25, 50, :) = [255, 255, 255]  % set RGB pixel at (25, 50)
imshow(B);

close all

%% example 1.6

A = imread('onion.png');        % read in 8-bit RGB color image
B = rgb2gray(A);                % convert to grayscale

subplot(1,2,1);
imshow(A);
axis image;

subplot(1,2,2);
imshow(B);

close all

%% example 1.7

A = imread('onion.png');        % read in 8-bit RGB color image
R = A(:,:,1);                   % extract R channel
G = A(:,:,2);                   % extract G channel
B = A(:,:,3);                   % extract B channel

figure;
subplot(1,4,1); imshow(A); axis image;
subplot(1,4,2); imshow(R); title('red');
subplot(1,4,3); imshow(G); title('green');
subplot(1,4,4); imshow(B); title('blue');