function [times] = steady_state_times(data)
    for i = 1:5
        x = [data{i}.Time_s_,data{i}.CH1__C_];       
        y = gradient(x(:,2));
            for j = 1:(length(x)-1)
                if y(j) == 0
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
        times(i) = remaining_vector(1);
    end
end