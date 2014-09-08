%% exercise 1.1

G = imread('images/cell.tif')       % read in grey-scale image
V = 1000

A = G
A(100,20) = A(100,20) - V

figure;
subplot(1,2,1);
imshow(G); title('original');

subplot(1,2,2);
imshow(A); title('altered');