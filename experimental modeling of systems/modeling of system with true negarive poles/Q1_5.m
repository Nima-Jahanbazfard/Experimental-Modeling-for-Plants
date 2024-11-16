close all
%clear all
clc
%calculation of T6 & T7 & T8 for model martabeh 2 
t_data = out.Q1(:, 1); 
y_data = out.Q1(:, 2); 
k=1.0001;
Tar = 1.4761;
Td=0.5120;
% fitting graph
spline_fit = fit(t_data, y_data, 'smoothingspline');

% ploting graph
figure;
plot(spline_fit, t_data, y_data);
hold on;
plot(t_data, y_data, 'o'); 

%finding times of  0.264*k & 0.6*k
y_target1 = 0.264*k; 
y_target2 = 0.6*k;
f1 = @(t) feval(spline_fit, t) - y_target1; 
t1 = fzero(f1, mean(y_data)); 
f2 = @(t) feval(spline_fit, t) - y_target2; 
t2 = fzero(f2, mean(y_data)); 

% showing results
plot(t1, y_target1, 'rx', 'MarkerSize', 10, 'LineWidth', 2); 
plot(t2, y_target2, 'gx', 'MarkerSize', 10, 'LineWidth', 2); 
legend('fitting graph','basic points','point for 0.264k','point for 0.6k');
title('for finding t for 0.28k and 0.63k');
xlabel('t');
ylabel('y');
grid on;
hold off;
xlabel('t');
ylabel('y');
grid on;
hold off;

% print of results
fprintf('for 0.264k the y=%.4f & t=%.4f\n', y_target1, t1);
fprintf('for 0.6k the y=%.4f & t=%.4f\n', y_target2, t2);
t_intercept=0.5120;
T6=t1-Td;
fprintf('T6=%.4f FOR G6\n', T6);
T7=(t2-Td)/2;
fprintf('T7=%.4f FOR G7\n', T7);
T8=(Tar-Td)/2;
fprintf('T8=%.4f FOR G8\n', T8);


