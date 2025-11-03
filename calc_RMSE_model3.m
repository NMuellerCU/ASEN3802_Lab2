function [RMSE,min_RMSE,min_alpha] = calc_RMSE_model3(data,u_model,alpha_mat)

RMSE = zeros(size(u_model));

for i = 1:size(u_model,1)
    for j = 1:length(data)

        % Grabbing data from cell matrices
        data_mat = table2array(data{j});
        model_mat = table2array(u_model{i,j});

        % Cutting off time column
        data_mat = data_mat(:,2:end);
        model_mat = model_mat(:,2:end);

        a = sum((data_mat-model_mat).^2,"all");
        b = numel(data_mat);

        RMSE(i,j) = sqrt(a / b);

    end
end

%% Plotting RMSE vs Alpha

yes_plot = 1;

if yes_plot == 1
    figure()
    hold on
    for i = 1:size(RMSE,2)
        plot(alpha_mat(:,i),RMSE(:,i),LineWidth=1.5)
    end
    hold off
    title("Root Mean Squared Error vs Thermal Diffusivity")
    xlabel("Thermal Diffusivity (m^2/s)")
    ylabel("Root Mean Squared Error (°C)")
    ylim([0,5])
    legend("Aluminum 25V","Aluminum 30V","Brass 25V","Brass 30V","Steel 22V");
    print("./Images/RMSE Plot","-dpng","-r300")
end

%% Finding Minimum RMSE Error and Corresponding Thermal Diffusivity

[min_RMSE,idx] = min(RMSE,[],1);

min_alpha = zeros(1,5);

for i = 1:length(min_alpha)
    min_alpha(i) = alpha_mat(idx(i),i);
end

end