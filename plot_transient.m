function [] = plot_transient(exp_data,model_data,model_num,file_info)

    figure('Position',[50 50 700 700],'Units','Inches')

    for i = 1:length(model_data)
        subplot(3,2,i)

        hold on
        plot(exp_data{i}.Time_s_,exp_data{i}.CH1__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH2__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH3__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH4__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH5__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH6__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH7__C_,"k",LineWidth=1.5)
        plot(exp_data{i}.Time_s_,exp_data{i}.CH8__C_,"k",LineWidth=1.5)
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
        ylim padded
        xlim tight
    end

    annotation("arrow",[0.465,0.465],[0.70,0.89],"LineWidth",1.5)
    annotation("textbox",[0.465,0.91,0.025,0.01],"String","CH8","EdgeColor","None")
    annotation("textbox",[0.465,0.70,0.025,0.01],"String","CH0","EdgeColor","None")
    annotation("arrow",[0.905,0.905],[0.70,0.89],"LineWidth",1.5)
    annotation("textbox",[0.905,0.91,0.025,0.01],"String","CH8","EdgeColor","None")
    annotation("textbox",[0.905,0.70,0.025,0.01],"String","CH0","EdgeColor","None")
    annotation("arrow",[0.465,0.465],[0.41,0.60],"LineWidth",1.5)
    annotation("textbox",[0.465,0.62,0.025,0.01],"String","CH8","EdgeColor","None")
    annotation("textbox",[0.465,0.41,0.025,0.01],"String","CH0","EdgeColor","None")
    annotation("arrow",[0.905,0.905],[0.41,0.60],"LineWidth",1.5)
    annotation("textbox",[0.905,0.62,0.025,0.01],"String","CH8","EdgeColor","None")
    annotation("textbox",[0.905,0.41,0.025,0.01],"String","CH0","EdgeColor","None")
    annotation("arrow",[0.465,0.465],[0.12,0.31],"LineWidth",1.5)
    annotation("textbox",[0.465,0.33,0.025,0.01],"String","CH8","EdgeColor","None")
    annotation("textbox",[0.465,0.12,0.025,0.01],"String","CH0","EdgeColor","None")
    legend("Experimental Data","","","","","","","","","Model Data",'Position',[0.595018446425396 0.244828578855089 0.253000004005432 0.0635445695733625])

    if model_num == 1.1
        sgtitle("Model 1A Transient vs. Experimental Response")
        print("./Images/Model 1A Transient Response","-dpng","-r300")
    elseif model_num == 1.2
        sgtitle("Model 1B Transient vs. Experimental Response")
        print("./Images/Model 1B Transient Response","-dpng","-r300")
    elseif model_num == 2
        sgtitle("Model 2 Transient vs. Experimental Response")
        print("./Images/Model 2 Transient Response","-dpng","-r300")
    end

end