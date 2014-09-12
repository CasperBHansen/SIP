function [ out ] = midway( I1, I2 )
    out = (histcum(I1) + histcum(I2)) ./ 2;
end