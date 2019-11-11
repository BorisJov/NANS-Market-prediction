function [ spent_total,gained_total ] = simulation_calc( x,y,fdp,daily_spend )
%SIMULATION_CALC Does the calculations by month of investment
%   x - day of year
%   y - actual values of stock
%   fdp - first derivative of expected values
%   daily_spend - how much to spend each day when expecting to gain
%   earnings - how much was lost/gained for each day

    SENSITIVITY = 0.05;

    spent = 0;
    stock = 0;
    spent_total = 0;
    gained_total = 0;
    
    for i = 1:length(x)
        if x(i) > 20 && x(i) <350
            if fdp(x(i)) > 0 + SENSITIVITY
                spent = spent + daily_spend;
                spent_total = spent_total + daily_spend;
                stock = stock + daily_spend/y(i);
            elseif fdp(x(i)) < 0 - SENSITIVITY
                gained_total = gained_total + stock * y(i);
                spent = 0;
                stock = 0;
            end
        else
            gained_total = gained_total + stock * y(i);
            stock = 0;
        end
    end

end

