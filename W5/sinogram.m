function [ out ] = sinogram( I, M )
    N = size(I, 1);
    out = zeros(N, M);
    for i = 1:M
        phi = 180/M * (i-1);
        tmp = imrotate(I, phi, 'bilinear', 'crop');
        out(:, i) = sum(tmp, 2); % integrate over the projection
    end
end