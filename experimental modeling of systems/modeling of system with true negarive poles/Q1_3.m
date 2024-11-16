close all
%clear all
clc
%calculation of t1 which happens in 0.28k and t2 which happens in 0.63k for
%calculating T4 & T5
fprintf('calculation of t1 which happens in 0.28k and t2 which happens in 0.63k for calculating T4 & T5\n');
k=1.0001;
x_t =out.Q1(:,1); 
y_y =out.Q1(:,2); 
%fitting graph
spline_fit = fit(x_t, y_y, 'smoothingspline');

% plot graph
figure;
plot(spline_fit, x_t, y_y);
hold on;
plot(x_t, y_y, 'o'); 
k=1.0001;
% data of 0.28k and 0.63k
y_target1 = 0.28*k; 
y_target2 = 0.63*k;

%time of 0.28k
f1 = @(t) (feval(spline_fit, t) - y_target1);
t1 = fzero(f1, mean(y_y)); 

%time for 0.63k
f2 = @(t) feval(spline_fit, t) - y_target2; 
t2 = fzero(f2, mean(y_y)); 

% showing results on plot
plot(t1, y_target1, 'rx', 'MarkerSize', 10, 'LineWidth', 2); 
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
T4=t2-t_intercept;
fprintf('T4=%.4f FOR G4\n', T4);
T5=1.5*(t2-t1);
fprintf('T5=%.4f FOR G5\n', T5);
