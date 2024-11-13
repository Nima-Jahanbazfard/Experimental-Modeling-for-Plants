close all
%clear all
clc
%calculation of T6 & T7 & T8 for model martabeh 2 
% فرض بر این است که داده‌های شبیه‌سازی در متغیری به نام 'data' در محیط کاری ذخیره شده‌اند
% ستون اول داده‌ها مربوط به t و ستون دوم مربوط به y می‌باشد
t_data = out.Q1(:, 1); % استخراج ستون t
y_data = out.Q1(:, 2); % استخراج ستون y
k=1.0001;
Tar = 1.4761;
Td=0.5120;
% فیت کردن منحنی با استفاده از اسپلاین
spline_fit = fit(t_data, y_data, 'smoothingspline');

% رسم منحنی
figure;
plot(spline_fit, t_data, y_data);
hold on;
plot(t_data, y_data, 'o'); % رسم نقاط اصلی به صورت دایره

% مقادیر y دلخواه که می‌خواهیم t آن‌ها را پیدا کنیم
y_target1 = 0.264*k; % مقدار y اول
y_target2 = 0.6*k; % مقدار y دوم

% پیدا کردن مقادیر t مربوط به y_target1 و y_target2

% برای y_target1
f1 = @(t) feval(spline_fit, t) - y_target1; % تابع برای y_target1
t1 = fzero(f1, mean(y_data)); % حدس اولیه میانگین t_data

% برای y_target2
f2 = @(t) feval(spline_fit, t) - y_target2; % تابع برای y_target2
t2 = fzero(f2, mean(y_data)); % حدس اولیه میانگین t_data

% نمایش مقادیر به دست آمده
plot(t1, y_target1, 'rx', 'MarkerSize', 10, 'LineWidth', 2); % نقطه اول
plot(t2, y_target2, 'gx', 'MarkerSize', 10, 'LineWidth', 2); % نقطه دوم

% اضافه کردن توضیحات
legend('منحنی فیت‌شده', 'نقاط اصلی', 'نقطه مربوط به y_target1', 'نقطه مربوط به y_target2');
title('رسم منحنی و یافتن t برای مقادیر y دلخواه');
xlabel('t');
ylabel('y');
grid on;
hold off;


xlabel('t');
ylabel('y');
grid on;
hold off;

% نمایش مقادیر t پیدا شده
fprintf('for 0.264k the y=%.4f & t=%.4f\n', y_target1, t1);
fprintf('for 0.6k the y=%.4f & t=%.4f\n', y_target2, t2);
t_intercept=0.5120;
T6=t1-Td;
fprintf('T6=%.4f FOR G6\n', T6);
T7=(t2-Td)/2;
fprintf('T7=%.4f FOR G7\n', T7);
T8=(Tar-Td)/2;
fprintf('T8=%.4f FOR G8\n', T8);


