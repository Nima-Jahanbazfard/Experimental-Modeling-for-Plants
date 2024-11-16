close all
%clear all
clc
% TIME AND THE DATA OF SYSTEMS
t_i = out.Q1(:,1); 
G = out.Q1(:,2); 
G6 = out.G6(:,2); 
G7 = out.G7(:,2); 
G8 = out.G8(:,2); 
G9 = out.G9(:,2);  
G10 = out.G10(:,2); 

% errors for G6
e1 = G6 - G;
maxE1 = max(max(abs(e1)));
absIntegralE1 = trapz(t_i, abs(e1));
squaredIntegralE1 = trapz(t_i, e1.^2);

% errors for G7
e2 = G7 - G;
maxE2 = max(max(abs(e2)));
absIntegralE2 = trapz(t_i, abs(e2));
squaredIntegralE2 = trapz(t_i, e2.^2);

% errors for G8
e3 = G8 - G;
maxE3 = max(max(abs(e3)));
absIntegralE3 = trapz(t_i, abs(e3));
squaredIntegralE3 = trapz(t_i, e3.^2);

% errors for G9
e4 = G9 - G;
maxE4 = max(max(abs(e4)));
absIntegralE4 = trapz(t_i, abs(e4));
squaredIntegralE4 = trapz(t_i, e4.^2);

% errors for G10
e5 = G10 - G;
maxE5 = max(max(abs(e5)));
absIntegralE5= trapz(t_i, abs(e5));
squaredIntegralE5 = trapz(t_i, e5.^2);


% gathering results in arrays and shwo in plots 
maxEs = [maxE1, maxE2, maxE3,maxE4,maxE5];
absIntegralEs = [absIntegralE1, absIntegralE2, absIntegralE3, absIntegralE4, absIntegralE5];
squaredIntegralEs = [squaredIntegralE1, squaredIntegralE2, squaredIntegralE3, squaredIntegralE4, squaredIntegralE5];
xLabels = {'G6', 'G7', 'G8', 'G9', 'G10'};
figure;

% max error
subplot(1,3,1);
bar(maxEs);
title('max error');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% integral of the value of error
subplot(1,3,2);
bar(absIntegralEs);
title('absIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');

% integral of e^2
subplot(1,3,3);
bar(squaredIntegralEs);
title('squaredIntegralErrors');
set(gca, 'XTickLabel', xLabels);
ylabel('ERROR');
xlabel('MODEL SYSTEMS');
fprintf('toward to the differnt errors which show,G10 has better performance');
