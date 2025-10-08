%% Lab 2 Main Script

% Preprocessor directives
clear;
close all;
clc;

%% Establishing Key Constants

const = const();

%% Reading in Data

[data,volts,amps,file_info] = filereadin();

%% Calling Initial State Slope

% Final parameter = index you want to read data at (1 = initial, 0 = steady)
[init.fit_data,init.temp] = temperature_slope(data,const.ch_position,1);

% Finding T_0
T_0 = table2array(init.fit_data(:,2));

%% Calling Steady State Slope Experimental

% Final parameter = index you want to read data at (1 = initial, 0 = steady)
[steady.fit_data,steady.temp] = temperature_slope(data,const.ch_position,0);

%% Calling Steady State Slope Approximation

[steady.approx_steady_slope] = approx_steady_slope(const,volts,amps,file_info);

%% Plotting Initial Temperatures

% Final parameter input: (1 = initial, 0 = steady)
plot_temp_slope(const.ch_position,init.temp,init.fit_data,file_info,T_0,0,1);

%% Plotting Steady State Temperatures

plot_temp_slope(const.ch_position,steady.temp,steady.fit_data,file_info,steady.fit_data(:,2),steady.approx_steady_slope,0);