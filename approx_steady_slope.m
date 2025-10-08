function [steady_slope] = approx_steady_slope(const,volts,amps,file_info)

    % Initializing steady_slope vector
    steady_slope = zeros(length(volts),1);

    for i = 1:length(volts)

        test_name = strsplit(file_info(i).name,'_');

        % Selecting correct k for specific 
        if test_name{1} == "Aluminum"
            k = const.alum.k;
        elseif test_name{1} == "Brass"
            k = const.brass.k;
        elseif test_name{1} == "Steel"
            k = const.steel.k;
        end

        % Calculating steady-state slope (H = IV/kA)
        steady_slope(i) = (amps(i)/1000 * volts(i)) / (k * const.A);

    end

end