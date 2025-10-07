%% Lab 2 Main Script

% Preprocessor directives
clear;
close all;
clc;

%% Establishing Key Variables

% Position of every channel from x_0 [m]
ch_position = zeros(1,8);
for i = 1:length(ch_position)
    ch_position(i) = 1.375*0.0254 + 0.0127*(i-1);
end

%% Reading in Data

[data,volts,amps,file_info] = filereadin();

%% Calling Initial State Slope

[fit_data] = initial_slope(data,ch_position);