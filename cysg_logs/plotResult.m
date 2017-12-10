
clear all;

% Version 1 : n = t*100000
% value1_n/100000 = value1_t

file_ID = fopen('stress_time_par8_v1.log','r');
% formatSpec = '%*4c %d %*c %f %*c'; 
formatSpec = '%*s %*d %*s %*s %*d %*s %f'; 
value = textscan(file_ID, formatSpec); 
fclose(file_ID);
value = value{1};

% Version 2 : n = t*1000000
% value2_n/1000000 = value2_t
file_ID = fopen('stress_time_par16.log','r');
% formatSpec = '%*4c %d %*c %f %*c'; 
formatSpec = '%*s %*d %*s %*s %*d %*s %f'; 
value2 = textscan(file_ID, formatSpec); 
fclose(file_ID);
value2=value2{1};

% range = 10.000000 * (3:1:32).^2.000000; 

%construct table 
ind = 1; 
for i = 1:length(value)/4
    value_t(i,1) = value(ind); 
    ind = ind + 1; 
    value_n(i,1) = value(ind); 
    ind = ind + 1; 
    value_g(i,1) = value(ind); 
    ind = ind + 1; 
    value_score(i,1) = value(ind); 
    ind = ind + 1; 
end 

ind = 1; 
for i = 1:length(value2)/4
    value2_t(i,1) = value2(ind); 
    ind = ind + 1; 
    value2_n(i,1) = value2(ind); 
    ind = ind + 1; 
    value2_g(i,1) = value2(ind); 
    ind = ind + 1; 
    value2_score(i,1) = value2(ind); 
    ind = ind + 1; 
end 

%plot real time (absolute times)
figure
subplot(1,2,1)
plot(value_t(:,1),value_t(:,1),'k--o');
hold on
plot(value_t(:,1),value_g(:,1),'b--o')

% plot(value2_n,value2_t(:,1),'k--o');
plot(value2_t(:,1),value2_g(:,1),'r--o');
legend('time budget','sequential','2 tasks');
subplot(1,2,2)
plot(value_t,value_score(:,1),'LineWidth',1);
hold on
plot(value2_t,value2_score(:,1),'LineWidth',1);
% plot(value2_n,log2(value2_n),'k--.','LineWidth',0.5);
% legend('tbb','K=4','K=8','K=16','K=32','K=64','K=128','K=256','K=512');
% title('Execution Time of edit\_distance for tbb and various chunk sizes'); 
% ylabel('Execution Time (sec)'); 
% xlabel('Problem Size (n)'); 


x = value2_n;
y=value2_t(:,1);
% myfit = fittype('a+b*log(x)',...
% 'dependent',{'y'},'independent',{'x'},...
% 'coefficients',{'a','b'});
% fit(x',y',myfit)
% 
% subplot(1,2,1)
% plot(value2_n,-380+24*log(value2_n),'b--o')
