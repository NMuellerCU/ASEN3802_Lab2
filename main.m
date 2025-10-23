%% Lab 2 Main Script

% Preprocessor directives
clear;
close all;
clc;

%% Establishing Key Constants

const = get_const();

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
% plot_temp_slope(const.ch_position,init.temp,init.fit_data,file_info,T_0,0,1);

%% Plotting Steady State Temperatures

% plot_temp_slope(const.ch_position,steady.temp,steady.fit_data,file_info,steady.fit_data(:,2),steady.approx_steady_slope,0);

%% Plotting Analytical Transient Solution Derivation

% Aluminum 25V, t = 1s
plot_transient_analytical(steady.approx_steady_slope(1),T_0(1),const.ch_position(end),[1,1000],const,1)

%% Calculating u(x,t) for each model

% Time Vector (End time for each individual trial)
t_vec = [height(data{1})*10,height(data{2})*10,height(data{3})*10,height(data{4})*10,height(data{5})*10];

% Model 1a
u_model_1a = calc_u_models(3,steady.approx_steady_slope,init.fit_data.Slope,T_0,const.ch_position,t_vec,const,[1,1,2,2,3],1,10);

% Model 1b
u_model_1b = calc_u_models(3,steady.fit_data.Slope,init.fit_data.Slope,T_0,const.ch_position,t_vec,const,[1,1,2,2,3],1,10);

% Model 2
u_model_2 = calc_u_models(3,steady.fit_data.Slope,init.fit_data.Slope,T_0,const.ch_position,t_vec,const,[1,1,2,2,3],2,10);

%% Plotting Transient Solutions for Each Model

plot_transient(data,u_model_1a,1.1,file_info);
plot_transient(data,u_model_1b,1.2,file_info);
plot_transient(data,u_model_2,2,file_info);