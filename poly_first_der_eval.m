function [ fd5,fd10 ] = poly_first_der_eval( data )
%POLY_FIRST_DER_EVAL Returns evaluation of investment based on 4 and 9
%years of data for the 5th and 10th year respectively. Evaluation is done
%through mean values of points.
%   data - cell structure with polynomial coefficients for 9(10) years
%   fd5, fd10 - evaluated derivatives for 5th and 10th year for all 365
%   days

    m = zeros(1,10);
    for i = 1:9
        m(i) = length(data{i});
    end
    datader = cell(1,9);
    valueder = zeros(9,365);
    
    for i=1:9
        datader{i} = polyder(data{i});
        for g=1:365
            valueder(i,g) = polyval(datader{i},g);
        end
    end
    
    fd5 = sum(valueder(1:4,:));
    fd10 = sum(valueder(1:9,:));
    
end

