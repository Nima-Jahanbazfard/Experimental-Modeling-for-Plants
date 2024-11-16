close all
% clear all
clc
% TIME AND THE DATA OF SYSTEMS
time = out.Q3(:,1); 
G = out.Q3(:,2)./0.1; 
G1 = out.G3_1(:,2)./0.1; 
G2 = out.G3_2(:,2)./0.1; 
G3 = out.G3_3(:,2)./0.1; 
G4 = out.G3_4(:,2)./0.1;  
G5 = out.G3_5(:,2)./0.1; 

% errors for G1
error2 = G1 - G;
maxError2 = max(max(abs(error2)));
absIntegralError2 = trapz(time, abs(error2));
squaredIntegralError2 = trapz(time, error2.^2);

% errors for G2
error3 = G2 - G;
maxError3 = max(max(abs(error3)));
absIntegralError3 = trapz(time, abs(error3));
squaredIntegralError3 = trapz(time, error3.^2);

% errors for G3
error4 = G3 - G;
maxError4 = max(max(abs(error4)));
absIntegralError4 = trapz(time, abs(error4));
squaredIntegralError4 = trapz(time, error4.^2);

% errors for G4
error5 = G4 - G;
maxError5 = max(max(abs(error5)));
absIntegralError5 = trapz(time, abs(error5));
squaredIntegralError5 = trapz(time, error5.^2);

% errors for G5
error6 = G5 - G;
maxError6 = max(max(abs(error6)));
absIntegralError6 = trapz(time, abs(error6));
squaredIntegralError6 = trapz(time, error6.^2);

% gathering results in arrays and shwo in plots 
maxErrors = [maxError2, maxError3, maxError4, maxError5, maxError6];
absIntegralErrors = [absIntegralError2, absIntegralError3, absIntegralError4, absIntegralError5, absIntegralError6];
squaredIntegralErrors = [squaredIntegralError2, squaredIntegralError3, squaredIntegralError4, squaredIntegralError5, squaredIntegralError6];
xLabels = {'G1', 'G2', 'G3', 'G4', 'G5'};
figure;

% max error
subplot(1,3,1);
bar(maxErrors);
title('max error');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% integral of the value of error
subplot(1,3,2);
bar(absIntegralErrors);
title('absIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% integral of e^2
subplot(1,3,3);
bar(squaredIntegralErrors);
title('squaredIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');
fprintf('toward to the differnt errors which show,G3_4 has better performance');

