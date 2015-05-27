function [ out ] = translate( I, t )
    [M,N] = size(I);
    Tt = [1 0 t(1);
          0 1 t(2);
          0 0 1  ];

    for x = 1:M
        for y = 1:N
            v = Tt * [x y 1]';
            out(mod(v(1),M)+1, mod(v(2),N)+1) = I(x,y);
        end
    end
end