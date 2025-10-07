function [fit_data] = initial_slope(data,x_pos)

    % Initializing fit_data
    fit_data = zeros(length(data),2);

    % Finding T_0 and initial temperature slope
    for i = 1:length(data)
        
        current_data = table2array(data{i});
        fit_data(i,:) = polyfit(x_pos,current_data(1,2:end),1);
    
    end

    % Converting fit_data into table
    fit_data = array2table(fit_data,"VariableNames",['Slope','T_0']);

end