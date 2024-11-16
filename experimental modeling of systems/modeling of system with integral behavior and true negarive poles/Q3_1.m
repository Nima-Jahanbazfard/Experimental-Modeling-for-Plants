close all
%clear all
clc
%calculate the value of k
fprintf('calculate the value of k\n');
n=50;
t_t=out.Q3(:,1);
o_o=out.Q3(:,2)./0.1;
k_1=mean(o_o(end-n+1:end));
fprintf('k=%.4f\n',k_1);
% calculation of Tar and Td and the time when the tangent line with the max
% slope meets the k line to calculate t2 and as a result calculate T1 & T2
fprintf('calculation of Tar and Td and the time when the tangent line with the maxslope meets the k line to calculate t2 and as a result calculate T1 & T2\n');
[a2,b2]= size(out.Q3);
for s=1:a2-1
sl(s)=((out.Q3(s+1,2)/0.1)-(out.Q3(s,2)/0.1))/(out.Q3(s+1,1)-out.Q3(s,1));
end

figure
plot(1:a2-1,sl);
grid on
number_of_slope=16;
max_slope=16.999;
T_ar=0;
for l=1:a2-1
    t_ar=(((out.Q3(l+1,1)-out.Q3(l,1))*((k_1-(out.Q3(l,2)/0.1))+(k_1-(out.Q3(l+1,2)/0.1))))/2)/k_1;
    T_ar = t_ar + T_ar;
end
fprintf('T_ar = %.4f\n',T_ar);
% data
ti = out.Q3(:,1); 
ou = out.Q3(:,2)/0.1; 
target_slope = 16.999;
% calculating diff for every point
dy_dt = diff(ou) ./ diff(ti);
%finding closest slope to target slope
[~, idx] = min(abs(dy_dt - target_slope));
% time and output of point of closest slope to target slope
t_tangent = ti(idx);
y_tangent = ou(idx);
% calculating clashing og tangent line with y=0
t_intercept = t_tangent - y_tangent / target_slope;
% calculating clashing of tangent line with y=k
target_y = k_1;
t_intercept_y2 = t_tangent + (target_y - y_tangent) / target_slope;
% showing results
fprintf('Td=%.4f\n', t_intercept);
fprintf('t2=%.4f\n', t_intercept_y2);
% plot major graph and tangent line
figure;
plot(ti, ou, 'b', 'LineWidth', 1.5);
hold on;
% plot tangent line
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
legend('System Output', 'Tangent Line', 'Intercept with Time Axis', 'Intercept with y = 20.0051');
grid on;
hold off;
fprintf('the time of clashing of tangent line and line 20.0051\n',t_intercept_y2);
%print of results
T1_1=T_ar-t_intercept;
fprintf('T1_1=Tar-Td=%.4f FOR G3_1\n',T1_1);
T2_2=t_intercept_y2-t_intercept;
fprintf('T2_2=t2-Td=%.4f FOR G3_2\n',T2_2);
