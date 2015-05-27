function [ out ] = rgb2grey( I )
    out = I(:,:,1) * 0.2989 + I(:,:,2) * 0.5870 + I(:,:,3) * 0.1140;
end