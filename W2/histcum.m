function [ out ] = histcum( I )
    h = imhist(I);
    out = cumsum(h/sum(h));
end