function [ out ] = backprojection( I, M, H )
    N = size(I, 1);
    out = zeros(N, N);
    mid = floor(N/2)+1;
    [xs, ys] = meshgrid(-N/2:N/2-1);
    
    % integrate p(x cos(phi) + y sin(phi)) d(phi) from 0 to pi
    for i = 1:M
        phi = 180/M * (i-1) * (pi/180);
        xi = round(mid + xs * cos(phi) + ys * sin(phi));
        indices = find((xi > 0) & (xi <= N));
        if (exist('H','var'))
            F = real(ifft(ifftshift(H .* fftshift(fft(I(:,i))))));
            out(indices) = out(indices) + F(xi(indices)) ./ M;
        else
            H = true;
            out(indices) = out(indices) + I(xi(indices), i) ./ M;
        end
    end
end