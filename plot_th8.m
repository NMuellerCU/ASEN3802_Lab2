function [] = plot_th8(exp_data, model1_data, model2_data, model3_data, model4_data, file_info)
    
    figure('Position',[50 50 700 700],'Units','Inches')

    for i = 1:length(exp_data)
        subplot(3,2,i)
        
        hold on
        plot(exp_data{i}.Time_s_,exp_data{i}.CH8__C_,'k')
        %plot(exp_data{i}.Time_s_,exp_data{i}.CH8__C_ - 2,'--k')
        %plot(exp_data{i}.Time_s_,exp_data{i}.CH8__C_ + 2,'--k')
        if i == 1
            fill([exp_data{i}.Time_s_(1:end-2); flip(exp_data{i}.Time_s_(1:end-2))], [exp_data{i}.CH8__C_(1:end-2) - 2; flip(exp_data{i}.CH8__C_(1:end-2) + 2)], 'k','FaceAlpha','0.1','EdgeAlpha',"0.15")
        else
            fill([exp_data{i}.Time_s_; flip(exp_data{i}.Time_s_)], [exp_data{i}.CH8__C_ - 2; flip(exp_data{i}.CH8__C_ + 2)], 'k','FaceAlpha','0.1','EdgeAlpha','0.15')
        end
        plot(model1_data{i}.Time, model1_data{i}.CH8,'r')
        plot(model2_data{i}.Time, model2_data{i}.CH8,'g')
        plot(model3_data{i}.Time, model3_data{i}.CH8,'b')
        plot(model4_data{i}.Time, model4_data{i}.CH8,'m')
        hold off

        b = strsplit(file_info(i).name,'_');
        title(b{1} + " " + b{2} + " " + b{3})
        xlabel('Time (s)')
        ylabel('Temperature (°C)')
        ylim padded
        xlim tight
    end

    %legend("Measured Temperature","Thermocouple Accuracy (\pm2°C)","","Model 1A","Model 1B","Model II",'Position',[0.595018446425396 0.244828578855089 0.253000004005432 0.0635445695733625])
    legend("Measured Temperature","Thermocouple Accuracy (\pm2°C)","Model 1A","Model 1B","Model II","Model III",'Position',[0.595018446425396 0.244828578855089 0.253000004005432 0.0635445695733625])
    sgtitle("Thermocouple 8 Measured vs. Modeled Temperature")
    print("./Images/Th8 Exp vs Model","-dpng","-r300")
end