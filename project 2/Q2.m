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
hold on
grid on
%by calcuting from the plant response :e1,e2,T_p,d
e1=1.4775;
t_e1=1.7636;
e2=1.0733;
t_e2=4.5982;
d=e2/e1;
%d=0.7264
T_p=t_e2-t_e1;
%T_p=2.8346

%by having d and T_p we could calculate w & zeta

% function for finding zeta
zeta=1/sqrt((1+((2*pi)/(log(d)))^2));
%zeta=0.0508

% function for finding w
w= 2*pi/(T_p*sqrt(1-zeta^2));
%w=2.2195
