function [ out ] = histmatch( I, T )
    Cz = histcum(T);
    Cx = histcum(I);
    CzInv = arrayfun(@(x) finv(Cz, x), Cx);
    out = CzInv(I);
end