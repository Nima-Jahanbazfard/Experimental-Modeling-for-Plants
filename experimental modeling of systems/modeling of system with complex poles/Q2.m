close all
%clear all
clc
%calculate the value of k
t_ime=out.Q2(:,1);
o_utput=out.Q2(:,2);
n=50;
k_k=mean(out.Q2(end-n+1:end));
fprintf('k=%.4f\n',k_k);
figure;
plot(t_ime, o_utput, 'b', 'LineWidth', 1.5);
title('system outout vs time');
hold on
grid on
%by calcuting from the plant response :e1,e2,T_p,d
e1=1.4775-k_k;
t_e1=1.7636;
e2=1.0733-k_k;
t_e2=4.5982;
d=e2/e1;
%d=0.1533
T_p=t_e2-t_e1;
%T_p=2.8346

%by having d and T_p we could calculate w & zeta

% function for finding zeta
zeta = 1/sqrt((1+((2*pi)/(log(d)))^2));
%zeta=0.2860

% function for finding w
w = 2*pi/(T_p*sqrt(1-zeta^2));
%w=2.3133

%finding delay
[a,b]= size(out.Q2);
for f=1:a-1
s(f)=(out.Q2(f+1,2)-out.Q2(f,2))/(out.Q2(f+1,1)-out.Q2(f,1));
end

figure
plot(1:a-1,s);
title('finding max slope');
grid on

num_of_slope=13;
maximum_slope=2.1299;

% data
t2_1 = out.Q2(:,1); 
y2_1 = out.Q2(:,2); 
tar_slope = 2.1299; 
% calculating diff for slope in every points
dy__dt = diff(y2_1) ./ diff(t2_1);
% finding closest slope to the target
[~, idx] = min(abs(dy_dt - tar_slope));
% time and output of closest slope
t_tan = t2_1(idx);
y_tan = y2_1(idx);
% calculatind Td
t_d = t_tan- y_tan / tar_slope;

% showing
fprintf('Td=%.4f\n', t_d);

% ploting major output and line
figure;
plot(t, y, 'b', 'LineWidth', 1.5);
hold on;
% ploting line
t_l = [t_tan - 1, t_tan + 1];
y_l = y_tan + tar_slope * (t_l - t_tan);
plot(t_l, y_l, 'r--', 'LineWidth', 1.5);
% showing Td
plot(t_d, 0, 'r*', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xlabel('Time');
ylabel('System Output');
title('for finding Td');

grid on;
hold off;
%Td=0.7222


