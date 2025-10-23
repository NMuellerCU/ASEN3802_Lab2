function [u_cell] = calc_u_models(n,H,M,T_0,x,time,const,material_num,model_num,t_step)
    % n - number of terms on Fourier series
    % H - steady state temperature slope (degreeC/m)
    % M - initial temperature slope (degreeC/m)
    % T_0 - initial temperature at x_0

    % Initializing u_cell
    u_cell = cell(1,5);

    for i = 1:5 % Cycling through each case (1 = Alum 25V)

        % Reinitializing temporary matrix to store all of data
        % Col 1: Time, Col 2-9: Channel Temperature
        temp_mat = zeros(length(0:time(i)/t_step),1+length(x));

        % Cycling through every time (height of temporary matrix)
        for t = 0:height(temp_mat)

            % Entering time value into matrix
            temp_mat(t+1,1) = t*t_step;

            % Iterating through each channel (thermocouple) at specific time to calculate temperature
            for k = 1:length(x)
                % Calling calculate temperature function for each cell
                temp_mat(t+1,k+1) = calcSum_u(n,H(i),M(i),T_0(i),x(k),temp_mat(t+1,1),const,material_num(i),model_num);
            end
        end

        % Converting temporary array into a table
        temp_table = array2table(temp_mat,VariableNames = {'Time','CH1','CH2','CH3','CH4','CH5','CH6','CH7','CH8'});
        
        % Adding table into specified spot in cell matrix
        u_cell{i} = temp_table;
    end
end