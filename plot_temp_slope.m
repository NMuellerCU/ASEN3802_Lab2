function [] = plot_temp_slope(x_pos,temp,fit_data,file_data,T_0,approx,choice)

    if choice == 1

        for i = 1:size(temp,1)
        
            current_data = temp(i,:);
            y_fit = T_0(i) + x_pos*table2array(fit_data(i,1));
    
            test = strsplit(file_data(i).name,"_");
    
            figure()
            hold on
            scatter(x_pos,current_data,20,'filled')
            plot(x_pos,y_fit,LineWidth=1.5)
            hold off
            title(test(1) + " " + test(2) + " " + test(3) + " Initial Temperature")
            xlabel("Distance from x_0 (m)")
            ylabel("Temperature (" + char(176) + "C)")
            ylim([min([current_data,y_fit])-1,max([current_data,y_fit])+1])
            legend("Experimental Data","Linear Fit","Location","northwest")
    
            print("./Images/Init_Temp" + file_data(i).name,"-dpng","-r300")
        
        end

    elseif choice == 0

         T_0 = table2array(T_0);

        for i = 1:size(temp,1)
        
            current_data = temp(i,:);
            y_fit = T_0(i) + x_pos*table2array(fit_data(i,1));
            y_approx = T_0(i) + x_pos*approx(i);
    
            test = strsplit(file_data(i).name,"_");
    
            figure()
            hold on
            scatter(x_pos,current_data,20,'filled')
            plot(x_pos,y_fit,LineWidth=1.5)
            plot(x_pos,y_approx,LineWidth=1.5)
            hold off
            title(test(1) + " " + test(2) + " " + test(3) + " Steady State Temperature")
            xlabel("Distance from x_0 (m)")
            ylabel("Temperature (" + char(176) + "C)")
            ylim([min([current_data,y_fit,y_approx])-1,max([current_data(1,2:end),y_fit,y_approx])+1])
            legend("Experimental Data","Linear Fit","Analytical Fit","Location","northwest")
    
            print("./Images/Steady_Temp" + file_data(i).name,"-dpng","-r300")
        
        end

    end

end