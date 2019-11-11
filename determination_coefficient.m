function res = determination_coefficient( x,y,p )
%SUM OF SQUARS TOTAL
%   x - x values of given points
%   y - y values of given points
%   freg - regression polynomial coefficients

    ymean = mean(y);
    sstot = sum((y - ymean).^2);
    %ssr = sum((polyval(p,x) - ymean).^2);
    ssres = sum((y-polyval(p,x)).^2);
     
    res = 1- ssres/sstot;
end
