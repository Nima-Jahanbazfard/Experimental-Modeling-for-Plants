close all
%clear all
clc
%datas which found in prevoius codes
tin=0.7138;
y_tin=0.2312;
tm=1.3847;
tx=0.5120;
Tp=tm-tx;
Tp=0.8727;
k=1.0001;

% function1
f = @(x) 1-(((1./x)+1).*exp((-1.*((x./(x-1)).*log(x)).*(1./x)))); 

% drawing plot
x_vals = 0:0.001:1; 
y_vals = f(x_vals);
figure;
plot(x_vals, y_vals, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Plot of function1');
grid on;
%finding T_1/T_2
y_target = 0.2312; 
x_target = fzero(@(x) f(x) - y_target, 0.2); 

% showing point on the plot
hold on;
plot(x_target, y_target, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(x_target, y_target, sprintf('  (%.4f, %.4f)', x_target, y_target), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
hold off;
fprintf('T_1/T_2=%.4f\n',x_target);
%T1/T2=0.3393

% function2
f2 = @(x) ((1./x).*exp(-1.*((x./(x-1)).*log(x)).*(1./x))); % y vs x

% drawing plot
x_vals2 = 0:0.001:1; 
y_vals2= f2(x_vals2);
figure;
plot(x_vals2, y_vals2, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Plot of function2');
grid on;

%finding T_2/Tp
x_target2 = 0.3393;
y_target2 = f2(x_target2); 

% showing point on the plot
hold on;
plot(x_target2, y_target2, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(x_target2, y_target2, sprintf('  (%.4f, %.4f)', x_target2, y_target2), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
hold off;
fprintf('T_2/Tp=%.4f\n',y_target2);
%T2/Tp=0.5740
%by having TP & T_1/T_2 & T_2/TP, we can find T_1 & T_2
T_2=y_target2*Tp;
fprintf('T_2=%.4f for G9\n',T_2);
%T_2=0.5010
T_1=T_2*x_target;
fprintf('T_1=%.4f for G9\n',T_1);
%T_1=0.1700

%finding Tin from function3 for comprating with tin which had been
%calculted from plant response

%function3
f3= @(x) (x./(x-1)).*log(x);
% drawing plot
x_vals3 = 0:0.001:1; 
y_vals3= f3(x_vals2);
figure;
plot(x_vals3, y_vals3, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Plot of function3');
grid on;

%finding T_2/Tp
x_target3 = 0.3393;
y_target3 = f2(x_target3); 

% showing point on the plot
hold on;
plot(x_target3, y_target3, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(x_target3, y_target3, sprintf('  (%.4f, %.4f)', x_target3, y_target3), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
hold off;
fprintf('Tin/T_2=%.4f\n',y_target3);
Tin=y_target3*T_2;
fprintf('Tin=%.4f\n',Tin);
%Tin=0.2876;

%for calculating T_d ,we go as follow:T_d=tin-Tin
T_d=tin-Tin;
fprintf('T_d=%.4f for G9\n',T_d);
T_d=0.4262;
