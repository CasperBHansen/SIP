function [ out ] = scale( N, sigma )
    % completely stolen from pp. 132 of the text book
      h = fspecial('gaussian', [N N], sigma);
      out = h;
end

