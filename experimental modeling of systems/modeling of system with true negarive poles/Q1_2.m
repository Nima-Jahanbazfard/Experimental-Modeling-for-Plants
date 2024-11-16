close all
%clear all
clc
%calculation of the slope of the tangent line at time=0 to calculate T3
fprintf('calculation of the slope of the tangent line at time=0 to calculate T3\n');
k=1.0001;
% extracting x & y data
time = out.Q1(:, 1); 
output = out.Q1(:, 2); 
dy_dt = diff(output) ./ diff(time);
slope_at_t0 = dy_dt(1);
% showing results
fprintf('M=%.4f\n', slope_at_t0);
T3=k/slope_at_t0;
fprintf('T3=k/M=%.4f FOR G3\n', T3);