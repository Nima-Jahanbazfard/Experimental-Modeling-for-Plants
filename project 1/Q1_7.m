%finding G10
tm= 1.3847;
tx=0.5120;
Tar= 1.4761;
k=1.0001;
ks=k/(tm-tx);
%ks=1.1460
landa=(-tm+Tar)*ks/k;
%landa=0.1047
%function
f_1= @(x) (log(x)/(x-1)).*exp(-1.*log(x)/(x-1));
%finding x
y_t = landa; 
x_t = fzero(@(x) f_1(x) - y_t, 0.2);
fprintf('x=%.4f\n',x_t);
T1_1=((x_t)^(1/(1-x_t)))/(ks/k);
%T1_1=0.0260
T1_2=T1_1/x_t;
%T1_2=0.7757
Td_d=Tar-T1_2-T1_1;
%Td_d=0.6744