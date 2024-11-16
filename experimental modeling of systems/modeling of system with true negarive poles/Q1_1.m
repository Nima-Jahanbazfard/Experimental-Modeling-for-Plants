close all
%clear all
clc
%calculate the value of k
fprintf('calculate the value of k\n');
n=50;
t=out.Q1(:,1);
o=out.Q1(:,2);
k=mean(out.Q1(end-n+1:end));
fprintf('k=%.4f\n',k);
% calculation of Tar and Td and the time when the tangent line with the max
% slope meets the k line to calculate t2 and as a result calculate T1 & T2
fprintf('calculation of Tar and Td and the time when the tangent line with the maxslope meets the k line to calculate t2 and as a result calculate T1 & T2\n');
[a1,b1]= size(out.Q1);
for m=1:a1-1
slope(m)=(out.Q1(m+1,2)-out.Q1(m,2))/(out.Q1(m+1,1)-out.Q1(m,1));
end

figure
plot(1:a1-1,slope);
grid on
numberofslope=10;
maxslope=1.14612;
Tar=0;
for j=1:a1-1
    tar=(((out.Q1(j+1,1)-out.Q1(j,1))*((k-out.Q1(j,2))+(k-out.Q1(j+1,2))))/2)/k;
    Tar = tar + Tar;
end
fprintf('Tar = %.4f\n',Tar);
% data
t = out.Q1(:,1); 
y = out.Q1(:,2); 
target_slope = 1.14612; 
% calculating diff for every point
dy_dt = diff(y) ./ diff(t);
% finding closest slope to target slope
[~, idx] = min(abs(dy_dt - target_slope));
% time and output of point of closest slope to target slope
t_tangent = t(idx);
y_tangent = y(idx);
% calculating clashing og tangent line with y=0
t_intercept = t_tangent - y_tangent / target_slope;
% calculating clashing of tangent line with y=k
target_y = k;
t_intercept_y2 = t_tangent + (target_y - y_tangent) / target_slope;
% showing results
fprintf('Td=%.4f\n', t_intercept);
fprintf('t2=%.4f\n', t_intercept_y2);
% plot major graph and tangent line
figure;
plot(t, y, 'b', 'LineWidth', 1.5);
hold on;
%plot tangent line
t_line = [t_tangent - 1, t_tangent + 1];
y_line = y_tangent + target_slope * (t_line - t_tangent);
plot(t_line, y_line, 'r--', 'LineWidth', 1.5);
% plot clashing point with y=0
plot(t_intercept, 0, 'r*', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
% plot clashing point with y=k
plot(t_intercept_y2, target_y, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
% settings of plots
xlabel('Time');
ylabel('System Output');
title('System Output and Tangent Line with Intercepts');
legend('System Output', 'Tangent Line', 'Intercept with Time Axis', 'Intercept with y = 1.0001');
grid on;
hold off;
fprintf('the time of clashing of tangent line and line 1.0001\n',t_intercept_y2);
%print of major results
T1=Tar-t_intercept;
fprintf('T1=Tar-Td=%.4f FOR G1\n',T1);
T2=t_intercept_y2-t_intercept;
fprintf('T2=t2-Td=%.4f FOR G2\n',T2);




