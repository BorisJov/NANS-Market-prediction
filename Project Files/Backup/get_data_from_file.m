function [ data ] = get_data_from_file( filename,m,lambda,mix )
%GET_DATA_FROM FILE Gets relevant data from file
%   filename - full string with extension
%   m - polynomial degree
%   lambda - regularization parameter
%   mix - whether to mix polynomial degrees a bit or not
%   data - cell structure, consisting of:
%           1. x-points
%           2. y-points
%           3. polynomial coefficients
%           4. determination coefficient

    f = fopen(filename,'r');

    formatSpec = '%d-%d-%d,%f,%f,%f,%f,%d,%d';
    sizeA = [9,inf];

    fgetl(f);
    pom = fscanf(f,formatSpec,sizeA);
    fclose(f);
    pom = pom';
    
    % getting last 10 years of data
    i = 1;
    while pom(i,1)<2007
        i = i + 1;
    end
    
    pom = pom(i:end,:);
    
    pom1 = datetime(pom(:,1:3));
    pom(:,3) = day(pom1,'dayofyear');
    
    data = cell(10,3);
    
    % choosing close values
    curr_ind = 1;
    for i=1:10
        begin_ind = curr_ind;
        while pom(curr_ind,3) < pom(curr_ind + 1,3)
            curr_ind = curr_ind + 1;
        end
        data{i,1} = pom(begin_ind:curr_ind,3);
        data{i,2} = pom(begin_ind:curr_ind,7);
        if mix == 0
            data{i,3} = regression_polynomial_ridge(data{i,1},data{i,2},m,lambda);
        else
            data{i,3} = regression_polynomial_ridge(data{i,1},data{i,2},m + rem(i,3) - 1,lambda);
        end
        data{i,4} = determination_coefficient(data{i,1},data{i,2},data{i,3});
        curr_ind = curr_ind + 1;
    end
    
end

