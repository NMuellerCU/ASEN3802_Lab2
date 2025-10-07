function [] = plot_init_temp(x_pos,data,fit_data,file_data)

    for i = 1:length(data)
    
        current_data = table2array(data{i});
        y_fit = linspace(0,0.2,8);
        y_fit = table2array(fit_data(i,2)) + x_pos*table2array(fit_data(i,1));

        test = strsplit(file_data(i).name,"_");

        figure()
        hold on
        scatter(x_pos,current_data(1,2:end))
        plot(x_pos,y_fit)
        hold off
        title(test(1) + " " + test(2) + " " + test(3) + " Initial Temperature")
        xlabel("Distance from x_0 (m)")
        ylabel("Temperature (" + char(176) + "C)")
        ylim([min([current_data(1,2:end),y_fit])-1,max([current_data(1,2:end),y_fit])+1])
        legend("Experimental Data","Linear Fit","Location","northwest")

        print("./Images/Init_Temp" + file_data(i).name,"-dpng","-r300")
    
    end

end