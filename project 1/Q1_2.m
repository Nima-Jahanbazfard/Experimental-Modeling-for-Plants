close all
%clear all
clc
%calculation of the slope of the tangent line at time=0 to calculate T3
fprintf('calculation of the slope of the tangent line at time=0 to calculate T3\n');
k=1.0001;
% استخراج داده‌های t و y
time = out.Q1(:, 1); % داده‌های زمان
output = out.Q1(:, 2); % داده‌های خروجی
% محاسبه تفاضلات عددی (مشتق) با استفاده از روش تفاضلات مرکزی
dy_dt = diff(output) ./ diff(time);
% فرض می‌کنیم اولین مقدار شیب در t = 0 تقریب خوبی از مشتق اولیه است
slope_at_t0 = dy_dt(1);
% نمایش نتیجه
fprintf('M=%.4f\n', slope_at_t0);
T3=k/slope_at_t0;
fprintf('T3=k/M=%.4f FOR G3\n', T3);