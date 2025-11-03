function [steady_model3] = steady_state_times(data, alpha, const)
    threshold = 1e-3; % 0.001, good threshold for slope
    L = const.L;
    steady_model3.Time = zeros(1,numel(data));
    steady_model3.Fo = zeros(1,numel(data));
    for i = 1:5

        t = data{i}.Time_s_;
        T = data{i}.CH1__C_;       
        y = abs(gradient(t,T));
            % for j = 1:(length(t)-1)
            %     if abs(y(j)) - threshold <= 0 % checks if y(j) is within our threshold
            %         b(j) = t(j);
            %     end
            % end
        first_zero_idx = find(y <= threshold, 1, 'first');
        if isempty(first_zero_idx)
            t_ss = t(end); % never hits steady state
        else
            t_ss = t(first_zero_idx);
        end

        steady_model3.Time(i) = t_ss;
        steady_model3.Fo(i) = alpha(i)*t_ss/(L^2);

    end
end

