%% assignment 2.3

I = imread('images/eight.tif');

Isp = imnoise(I, 'salt & pepper', 0.03);
Igs = imnoise(I, 'gaussian', 0.02);

% mean filter (credit: matlab examples)
mean_times = 1:25
for N = 1:25
    tic;
    for i = 1:100
        k = ones(N,N) / (N*N);
        IMsp = imfilter(Isp, k);
        IMgs = imfilter(Igs, k);
    end
    mean_times(N) = toc;
end

% median filter (credit: matlab examples)
median_times = 1:25
for N = 1:25
    tic;
    for i = 1:100
        IMsp = medfilt2(Isp, [N N]);
        IMgs = medfilt2(Igs, [N N]);
    end
    median_times(N) = toc;
end

figure(1);
subplot(2,1,1), plot(1:25, mean_times), title('mean times');
subplot(2,1,2), plot(1:25, median_times), title('median times');

figure(2);
subplot(2,3,1), imagesc(Isp), axis image, title('Salt & Pepper (original)');
subplot(2,3,4), imagesc(Igs), axis image, title('Gaussian (original)');

N = 3
k = ones(N,N) / (N*N);
IMeanSp = imfilter(Isp, k);
IMeanGs = imfilter(Igs, k);
subplot(2,3,2), imagesc(IMeanSp), axis image, title('Salt & Pepper (mean)');
subplot(2,3,5), imagesc(IMeanGs), axis image, title('Gaussian (mean)');

IMedSp = medfilt2(Isp, [N N]);
IMedGs = medfilt2(Igs, [N N]);
subplot(2,3,3), imagesc(IMedSp), axis image, title('Salt & Pepper (median)');
subplot(2,3,6), imagesc(IMedGs), axis image, title('Gaussian (median)');
colormap(gray);

%% assignment 2.4

I = imread('images/eight.tif');

N = 15;
k = fspecial('gaussian', [N N], 5);
G = imfilter(I,k);
imshow(G);

%% assignment 2.5

I = imread('images/eight.tif');

sigma = 10;
N = 3 * sigma;
k = fspecial('gaussian', [N N], sigma);
G = imfilter(I,k);
imshow(G);
