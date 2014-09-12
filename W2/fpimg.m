function [ out ] = fpimg( I, cdf )
    ds = double(I);
    out = arrayfun(@(x) cdf(x), ds);
end

