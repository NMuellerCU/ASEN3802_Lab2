function [u_cell] = calc_u_models(n,H,M,T_0,x,t,const,material_num,model_num,t_step)

    % Initializing u_cell
    u_cell = cell(1:5);

    % Models 1a and 1b
    if model_num == 1
        for i = 1:5 % Cycling through each case
            temp_mat = zeros(1+length(x))
            for j = 0:t_step:t(i)
                for k = 1:length(x)
                    temp_mat = calcSum_u() 
                end
            end
        end

    % Model 2
    elseif model_num == 2

        






    end


end