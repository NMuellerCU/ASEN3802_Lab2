function [fit_data,temps] = temperature_slope(data,x_pos,idx)

    % Initializing fit_data
    fit_data = zeros(length(data),2);
    temps = zeros(length(data),size(data{1},2)-1);

    % Finding T_0 and initial temperature slope
    for i = 1:length(data)

        % Extracting current data from cell array
        current_data = table2array(data{i});

        for j = 2:9
            % Averaging temperature values in range that user wants
            if idx ~=0
                temps(i,j-1) = mean(current_data(idx,j));
            else % Steady State
                temps(i,j-1) = mean(current_data(end-100:end-10,j));
            end
        end

        % Linearly fitting data
        fit_data(i,:) = polyfit(x_pos,temps(i,:),1);
    
    end

    % Converting fit_data into table
    fit_data = array2table(fit_data,"VariableNames",{'Slope','T_0'});

end