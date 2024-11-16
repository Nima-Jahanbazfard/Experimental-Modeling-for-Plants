close all
%clear all
clc
%calculation of t1 which happens in 0.28k and t2 which happens in 0.63k for
%calculating T4 & T5
fprintf('calculation of t1 which happens in 0.28k and t2 which happens in 0.63k for calculating T4 & T5\n');
k_1=20.0051;
t_d=0.8488;
x_t =out.Q3(:,1); 
y_y =out.Q3(:,2)/0.1; 
%fitting graph
spline_fit = fit(x_t, y_y, 'smoothingspline');

% plot graph
figure;
plot(spline_fit, x_t, y_y);
hold on;
plot(x_t, y_y, 'o'); 
% data of 0.28k and 0.63k
y_target1 = 0.28*k_1; 
y_target2 = 0.63*k_1;

%time of 0.28k
f1 = @(t) feval(spline_fit, t) - y_target1;
t1 = fzero(f1, 0.28*k_1); 

%time for 0.63k
f2 = @(t) feval(spline_fit, t) - y_target2; 
t2 = fzero(f2, 0.63*k_1); 

% showing results on plot
plot(t1, y_target1, 'bx', 'MarkerSize', 10, 'LineWidth', 2); 
plot(t2, y_target2, 'gx', 'MarkerSize', 10, 'LineWidth', 2); 

% plot setting
legend('fitting graph','basic points','point for 0.28k','point for 0.63k');
title('for finding t for 0.28k and 0.63k');
xlabel('t');
ylabel('y');
grid on;
hold off;

% print of results
fprintf('for 0.28k the y=%.4f & t=%.4f\n', y_target1, t1);
fprintf('for 0.63k the y=%.4f & t=%.4f\n', y_target2, t2);
T4=t2-t_d;
fprintf('T4=%.4f FOR G4_1\n', T4);
T5=1.5*(t2-t1);
fprintf('T5=%.4f FOR G5_1\n', T5);