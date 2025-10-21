function [] = plot_transient_analytical(H,T_0,x,t,const,material_num)

    % Initializing n and u vectors
    n = 0:10;
    sum_u = zeros(length(t),length(n));

    % Calculating sum_u vector
    for j = 1:length(t)
        for i = n
            sum_u(j,i+1) = calcSum_u(i,H,[],T_0,x,t(j),const,material_num,1);
        end
    end

    % Plotting Results
    figure()
    hold on
    plot(n,sum_u(1,:),".-",LineWidth=1.5,MarkerSize=20)
    plot(n,sum_u(2,:),".-",LineWidth=1.5,MarkerSize=20)
    hold off
    title("Analytical Transient Solution (Thermocouple 8)");
    ylabel("\Sigma u(x,t)")
    xlabel("n")
    legend("t = " + t(1) + "s","t = " + t(2) + "s","Location","southeast")
    ylim([10,ceil(max(sum_u,[],"all"))+2])
    print("./Images/Analyical Transient Solution","-dpng","-r300")

end