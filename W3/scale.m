function [ out ] = scale( I, s )
    % completely stolen from pp. 132 of the text book
    FA = fft2(I);
    FA = fftshift(FA);
    PSF = fspecial('gaussian', size(I), s);
    OTF = fft2(PSF);
    OTF = fftshift(OTF);
    F = ifft2(OTF.*FA);
    F = fftshift(F);
    out = F;
end

