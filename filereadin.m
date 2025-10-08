function [data,volts,amps,a] = filereadin()

% Returns cell array with table in each cell, volt array, amp array, and
% file information array

a=dir('./ASEN3802_HeatConduction_FA25/*mA');
volts = zeros(1,length(a));
amps = zeros(1,length(a));
data = cell(1,length(a));

%% Reading Data into Cell Array

for i=1:length(a)    
    warning('off', 'all');
    data{i} = readtable("./ASEN3802_HeatConduction_FA25/" + a(i).name);
    % how to get voltage and amperage from file names?
    % - options include strsplit, regex, etc.
    % ultimately, we need to use the format of each file name
    % 'material'_'volts'V_'amps'mA
    b = strsplit(a(i).name,'_'); % gives a cell array (b) that is 1x3
    % {'material','voltsV','ampsmA'} -- now split by 'V' and 'mA'
    v = strsplit(b{2},'V'); % volts are always in the second portion
    ampval= strsplit(b{3},'mA'); % amps are always in the third portion
    volts(i) = str2double(v{1}); % convert string to number (vector)
    amps(i) = str2double(ampval{1});
end
