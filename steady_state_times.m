function [steady_model3] = steady_state_times(data, alpha, const)
    threshold = 1e-3; % 0.001, good threshold for slope
    L = const.L;
    steady_model3.Time = 0;
    steady_model3.Fo = 0;
    for i = 1:5

        x = [data{i}.Time_s_,data{i}.CH1__C_];       
        y = gradient(x(:,2),x(:,1));
            for j = 1:(length(x)-1)
                if abs(y(j)) - threshold <= 0 % checks if y(j) is within our threshold
                    b(j) = x(j,1);
                end
            end
        first_zero_idx = find(b == 0, 1, 'last');
        if isempty(first_zero_idx)
            remaining_vector = b;
        else
            start_index = first_zero_idx + 1;
            remaining_vector = b(start_index : end);
        end
        t_ss = remaining_vector(1);

        steady_model3.Time(i) = t_ss;
        steady_model3.Fo(i) = alpha(i)*t_ss/(L^2);

        b = 0;
    end
end

