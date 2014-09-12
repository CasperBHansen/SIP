function [ out ] = finv( cdf, l )
    indices = find( arrayfun(@(x) x >= l, cdf) ); % indices where f(s) >= l
    out = min(cdf(indices)); % minimum corresponds to the inverse
end