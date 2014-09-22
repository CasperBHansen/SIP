function [ out ] = someFunc ( I, a, v, w )
    s = size(I);
    R = [s(1) s(2)];
    for x = 1:s(1)
        for y = 1:s(2)
            R(x,y) = I(x,y) + a * cos(v*x + w*y);
        end
    end
    out = R;
end

