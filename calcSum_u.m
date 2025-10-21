function [u] = calcSum_u(n,H,M,T_0,x,t,const,material_num,model_num)

    % Calculating 
    u = T_0 + H*x; % steady state

    if n > 0
        for i = 1:n
            
            % Calculating b_n
            b_n = calc_b_n(i,H,M,const,model_num);

            % Calculating lambda_n
            lambda_n = calc_lambda_n(i,const);

            if material_num == 1
                % Calculating u(x,t)
                u = u + b_n * sin(lambda_n*x) * exp(-lambda_n^2 * const.alum.alpha * t);
            elseif material_num == 2
                u = u + b_n * sin(lambda_n*x) * exp(-lambda_n^2 * const.brass.alpha * t);
            elseif material_num == 3
                u = u + b_n * sin(lambda_n*x) * exp(-lambda_n^2 * const.steel.alpha * t);
            end

        end
    end

    %% Function to calculate lambda_n
    function [lambda_n] = calc_lambda_n(n,const)
        lambda_n = (2*n - 1)*pi/(2*const.L);
    end

    %% Function to calculate the b_n
    function [b_n] = calc_b_n(n,H,M,const,model_num)

        if (n == 0)
            b_n = 0;
        elseif model_num == 1
            b_n = 8*H*const.L*(-1)^n / ((2*n - 1)*pi)^2;
        elseif model_num == 2
            b_n = 8*(M-H)*const.L*(-1)^(n+1) / ((2*n-1)*pi)^2;
        end

    end
end