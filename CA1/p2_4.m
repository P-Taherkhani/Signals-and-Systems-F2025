function [alpha, beta] = p2_4(x, y)
    % Ensure column vectors
    x = x(:);
    y = y(:);

    % Construct design matrix
    X = [x ones(size(x))];

    % Solve for [alpha; beta]
    params = (X' * X) \ (X' * y);

    alpha = params(1);
    beta  = params(2);
end



