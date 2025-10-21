function [u_cell] = calc_u_models(n,H,M,T_0,x,time,const,material_num,model_num,t_step)

    % Initializing u_cell
    u_cell = cell(1,5);

    for i = 1:5 % Cycling through each case
        temp_mat = zeros(length(0:time(i)/t_step),1+length(x));
        for t = 0:(time(i)/10)
            temp_mat(t+1,1) = t*t_step;
            for k = 1:length(x)
                temp_mat(t+1,k+1) = calcSum_u(n,H(i),M(i),T_0(i),x(k),t,const,material_num(i),model_num);
            end
        end

        temp_table = array2table(temp_mat,VariableNames = {'Time','CH1','CH2','CH3','CH4','CH5','CH6','CH7','CH8'});
        
        u_cell{i} = temp_table;
    end



end