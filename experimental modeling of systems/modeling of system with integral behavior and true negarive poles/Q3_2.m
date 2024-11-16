close all
%clear all
clc
%calculation of the slope of the tangent line at time=0 to calculate T2_1
fprintf('calculation of the slope of the tangent line at time=0 to calculate T3\n');
k_1=20.0051;
% extracting x & y data
time = out.Q3(:, 1);  
output = out.Q3(:, 2)/0.1; 
dy_dt = diff(output) ./ diff(time);
slope_at_t0 = dy_dt(1);
% showing results
fprintf('M=%.4f\n', slope_at_t0);
T3=k_1/slope_at_t0;
fprintf('T3=k/M=%.4f FOR G3_1\n', T3);