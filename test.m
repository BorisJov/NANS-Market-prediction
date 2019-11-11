
data_0 = get_data_from_file('Stocks/aapl.us.txt',10,0,0)
[fd5_0,fd10_0] = poly_first_der_eval(data_0(:,3));

data_05 = get_data_from_file('Stocks/aapl.us.txt',10,0.5,0)
[fd5_05,fd10_05] = poly_first_der_eval(data_05(:,3));

data_1 = get_data_from_file('Stocks/aapl.us.txt',10,1,0)
[fd5_1,fd10_1] = poly_first_der_eval(data_1(:,3));

x_all = 1:365;

f = figure(1);
subplot(2,1,1), scatter(data{10,1},data{10,2});
title('10 godina');
subplot(2,1,2), plot(x_all(15:350),fd10_0(15:350),x_all(15:350),fd10_05(15:350),x_all(15:350),fd10_1(15:350));

% figure
% subplot(4,1,1), scatter(data{5,1},data{5,2});
% title('5 godina');
% subplot(4,1,2), plot(x_all(15:350),fd5_0(15:350));
% subplot(4,1,3), plot(x_all(15:350),fd5_05(15:350));
% subplot(4,1,4), plot(x_all(15:350),fd5_1(15:350));

