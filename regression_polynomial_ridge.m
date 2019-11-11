function p = regression_polynomial_ridge( x,y,m,lambda )
%REGRESSION_POLYNOMIAL_RIDGE Polynomial regression with L2 regularisation
%   Input:
% x,y - points
% m - polynomial degree
% lambda - L2 regularisation parameter
%   Output:
% p - polynomial coefficients

    n = length(x);
    X = ones(n,m+1);
    for i=1:n
        for j=2:m+1
            X(i,j) = x(i)^(j-1);
        end
    end
    
    p = (X'*X + lambda * eye(m+1))\(X'*y);
    p = fliplr(p');

end

