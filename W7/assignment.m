%
% Signal & Image Processing
% Week 7
%
% fvx507@alumni.ku.dk
%

%% assignment 2

ones(10)*ones(10); % bug circumvention
clc, clear all;

I = load('images/TestImageQn2.mat');
SE = strel('diamond', 1); % R=2 closes entirely

I1 = imopen(I.TestImageQn2, SE);
I2 = imclose(I.TestImageQn2, SE);

figure (1), colormap(gray);
subplot(1,3,1), imagesc(I.TestImageQn2), axis image, axis off, title('original');
subplot(1,3,2), imagesc(I1), axis image, axis off, title('opened');
subplot(1,3,3), imagesc(I2), axis image, axis off, title('closed');


%% assignment 3

clc, clear all;

I = imread('images/blobs.png');
N = 3;

SE = [strel('line', 50, 1), strel('disk', 3), strel('square', 6)];
t = cellstr(['line  '; 'disk  '; 'square']);

% hit-or-miss
figure (2), colormap(gray);
for i = 1:N
    R = bwhitmiss(I, SE(i), strel(not(SE(i).getnhood)));
    subplot(1,N,i), imagesc(R), axis image, axis off, title(t(i));
end

% top hat
figure (3), colormap(gray);
for i = 1:N
    R = imtophat(I, SE(i));
    subplot(1,N,i), imagesc(R), axis image, axis off, title(t(i));
end

% bottom hat
figure (4), colormap(gray);
for i = 1:N
    R = imbothat(I, SE(i));
    subplot(1,N,i), imagesc(R), axis image, axis off, title(t(i));
end


%% assignment 4

clc, clear all;

I = imread('images/rice.png');
B7 = imopen(I, strel('disk',7));
B8 = imopen(I, strel('disk',8)); % optimal radius
B9 = imopen(I, strel('disk',9));
S = imsubtract(I,B8);
R = imadjust(S);

figure (5), colormap(gray);
subplot(1,3,1), imagesc(B7), axis image, axis off, title('radius = 7');
subplot(1,3,2), imagesc(B8), axis image, axis off, title('radius = 8');
subplot(1,3,3), imagesc(B9), axis image, axis off, title('radius = 9');

figure (6), colormap(gray);
subplot(1,4,1), imagesc(I), axis image, axis off, title('original');
subplot(1,4,2), imagesc(B8), axis image, axis off, title('background');
subplot(1,4,3), imagesc(S), axis image, axis off, title('subtracted');
subplot(1,4,4), imagesc(R), axis image, axis off, title('enhanced');


%% assignment 5

clc, clear all;
DS = {}; SE = {}; I = imread('images/test_digits.bmp');
FS = {'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'zero'};

% load digit files
for d = 1:size(FS,2)
    DS{d} = imread(strcat('images/', FS{d}, '.bmp'));
    
    % construct structural elements
    E1 = imerode(DS{d}, strel('diamond', 1));
    E2 = imerode(~DS{d}, strel('diamond', 1));
    SE1 = strel(bwmorph(E1, 'skel', Inf));
    SE2 = strel(E2);
    SE{d} = [SE1,SE2];
end

% display digits images
figure (7), colormap(gray);
l = size(DS,2);
for d = 1:l
    subplot(3,10,d), imagesc(DS{d}), axis image, axis off, title(int2str(d));
    subplot(3,10,(d+l)), imagesc(SE{d}(1).getnhood), axis image, axis off, title(int2str(d));
    subplot(3,10,(d+(2*l))), imagesc(SE{d}(2).getnhood), axis image, axis off, title(int2str(d));
end

% perform hit or miss and display detections
figure (9), colormap(gray);
N = [10,3,5];
R = cat(1, zeros(size(I)));
size(R)
for i = 1:size(N,2)
    P = bwhitmiss(I, SE{N(i)}(1).getnhood, SE{N(i)}(2).getnhood);
    P = imdilate(P, strel('disk',15));
    R = R + P;
end
subplot(1,2,1), imagesc(I), axis image, axis off, title('original');
subplot(1,2,2), imagesc(R-I), axis image, axis off, title('detections');

%% assignment 6

clc, clear all;

N = 5; sigma = 2; R = 5;

Disk = strel('diamond', R);
Plain = strel(ones(8));

I = imread('images/flowers.jpg');
G = rgb2grey(I);
H = fspecial('gaussian', [N N], sigma);
A = G; % imfilter(G, H);
Amin = imerode(A, Disk);
Amax = imdilate(A, Disk);
E = Amax - Amin;
DE = imerode(imdilate(E, Plain), Plain);

figure (8), colormap(gray);
subplot(1,4,1), imagesc(I), axis image, axis off, title('original');
subplot(1,4,2), imagesc(G), axis image, axis off, title('gray-scale');
subplot(1,4,3), imagesc(E), axis image, axis off, title('edges');
subplot(1,4,4), imagesc(DE), axis image, axis off, title('erode and dilate');

figure(9), colormap(gray);
imshow(cat(1, zeros(size(I))));
hold on;
h = imshow(I); set(h, 'AlphaData', DE);
hold off;
