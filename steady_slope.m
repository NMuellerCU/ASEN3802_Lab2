function [steady_temp,fit_data] = steady_slope(data,x_pos)

    % Initializing fit_data
    steady_temp = zeros(length(data),8);
    fit_data = zeros(length(data),2);

    % Finding T_0 and initial temperature slope
    for i = 1:length(data)
        
        current_data = table2array(data{i});
        
        for j = 2:9
            steady_temp(i,j-1) = mean(current_data(end-100:end-10,j));
        end

        fit_data(i,:) = polyfit(x_pos,steady_temp(i,:),1);
    
    end

    % Converting fit_data into table
    fit_data = array2table(fit_data,"VariableNames",{'Slope','T_0'});

end