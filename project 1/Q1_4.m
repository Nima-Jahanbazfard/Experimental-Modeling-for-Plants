close all
%clear all
clc
% TIME AND THE DATAS OF SYSTEMS
time = out.Q1(:,1); 
data1 = out.Q1(:,2); 
data2 = out.G1(:,2); 
data3 = out.G2(:,2); 
data4 = out.G3(:,2); 
data5 = out.G4(:,2);  
data6 = out.G5(:,2); 

% محاسبه خطاها برای data2 نسبت به data1
error2 = data2 - data1;
maxError2 = max(max(abs(error2)));
absIntegralError2 = trapz(time, abs(error2));
squaredIntegralError2 = trapz(time, error2.^2);

% محاسبه خطاها برای data3 نسبت به data1
error3 = data3 - data1;
maxError3 = max(max(abs(error3)));
absIntegralError3 = trapz(time, abs(error3));
squaredIntegralError3 = trapz(time, error3.^2);

% محاسبه خطاها برای data4 نسبت به data1
error4 = data4 - data1;
maxError4 = max(max(abs(error4)))
absIntegralError4 = trapz(time, abs(error4));
squaredIntegralError4 = trapz(time, error4.^2);

% محاسبه خطاها برای data5 نسبت به data1
error5 = data5 - data1;
maxError5 = max(max(abs(error5)));
absIntegralError5 = trapz(time, abs(error5));
squaredIntegralError5 = trapz(time, error5.^2);

% محاسبه خطاها برای data6 نسبت به data1
error6 = data6 - data1;
maxError6 = max(max(abs(error6)));
absIntegralError6 = trapz(time, abs(error6));
squaredIntegralError6 = trapz(time, error6.^2);

% جمع‌آوری نتایج در آرایه‌های جداگانه برای رسم نمودار
maxErrors = [maxError2, maxError3, maxError4, maxError5, maxError6];
absIntegralErrors = [absIntegralError2, absIntegralError3, absIntegralError4, absIntegralError5, absIntegralError6];
squaredIntegralErrors = [squaredIntegralError2, squaredIntegralError3, squaredIntegralError4, squaredIntegralError5, squaredIntegralError6];

% رسم نتایج به صورت نمودار ستونی
xLabels = {'G1', 'G2', 'G3', 'G4', 'G5'};
figure;

% نمودار خطای ماکزیمم
subplot(1,3,1);
bar(maxErrors);
title('max error');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% نمودار انتگرال خطای مطلق
subplot(1,3,2);
bar(absIntegralErrors);
title('absIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% نمودار انتگرال خطای مجذور
subplot(1,3,3);
bar(squaredIntegralErrors);
title('squaredIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');
fprintf('toward to the differnt errors which show,G5 has better performance');

