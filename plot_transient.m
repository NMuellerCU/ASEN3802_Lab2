function [] = plot_transient(exp_data,model_data,model_num,file_info)

    figure()

    for i = 1:length(model_data)
        subplot(2,3,i)

        hold on
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH1__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH2__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH3__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH4__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH5__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH6__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH7__C_,"k",LineWidth=1.5)
        % plot(exp_data{i}.Time_s_,exp_data{i}.CH8__C_,"k",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH1,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH2,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH3,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH4,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH5,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH6,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH7,"r",LineWidth=1.5)
        plot(model_data{i}.Time,model_data{i}.CH8,"r",LineWidth=1.5)
        hold off
        
        b = strsplit(file_info(i).name,'_');
        title(b{1} + " " + b{2} + " " + b{3})
        xlabel("Time (s)")
        ylabel("Temperature °C")
        xlim([0,1000])
    end

    if model_num == 1.1
        sgtitle("Model 1a Transient Response vs. Experimental")
    elseif model_num == 1.2
        sgtitle("Model 1b Transient Response vs. Experimental")
    elseif model_num == 2
        sgtitle("Model 2 Transient Response vs. Experimental")
    end

    legend("Experiemental Data","","","","","","","","","Model Data",'Position',[0.731356000064144 0.343114293140803 0.13765823006127 0.0635445695733625])

        

        












end