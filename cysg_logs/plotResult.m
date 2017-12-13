
clear all;

ref = readLogs('stress_time_ref.log');
parall = readLogs('stress_time_par_all.log');
parallv1 = readLogs('stress_time_par_all_v1.log');
parallv2 = readLogs('stress_time_par_all_v2.log');
parallv3 = readLogs('stress_time_par_all_v3.log');
parallv4 = readLogs('stress_time_par_all_v4.log');

par2 = readLogs('stress_time_par2.log');
par36v2 = readLogs('stress_time_par36_v2.log');
multi = readLogs('stress_time_multi.log');
fourier = readLogs('stress_time_fourier.log');
lasttwo = readLogs('stress_time_lasttwo.log');
matrix = readLogs('stress_time_matrix.log');
pairs = readLogs('stress_time_pairs.log');
rest = readLogs('stress_time_rest.log');

multi24 = readLogs('stress_time_multi24.log');
test = readLogs('test.log');
test1 = readLogs('test1.log');
test2 = readLogs('test2.log');

% 
% figure
% plot(ref.t,ref.t,'k--o');
% hold on
% plot(multi.t,multi.g,'--o');
% plot(fourier.t,fourier.g,'--o');
% plot(lasttwo.t,lasttwo.g,'--o');
% plot(matrix.t,matrix.g,'--o');
% plot(pairs.t,pairs.g,'--o');
% plot(rest.t,rest.g,'--o');
% 
% figure
% plot(multi24.t,multi24.g,'--o');
% hold on
% plot(multi.t,multi.g,'--o');
% 

%plot real time (absolute times)
figure
subplot(1,2,1)
plot(ref.t,ref.t,'k');
hold on
plot(ref.t,ref.g,'b--o')
plot(par36v2.t,par36v2.g,'b--x');
% plot(parall.t,parall.g,'r--o');

legend('Time budget','sequential','parallelize DoMultinom');
ylabel('execution time');
xlabel('Time budget');
subplot(1,2,2)
plot(ref.t,ref.score,'k-o');
hold on
plot(par36v2.t,par36v2.score,'b-x');
% plot(parall.t,parall.score,'r--o');
legend('Sequential','parallelize DoMultinom');

% 
% figure
% subplot(1,2,1)
% plot(ref.t,ref.t,'k--o');
% hold on
% plot(parall.t,parall.g,'b--o');
% plot(parallv1.t,parallv1.g,'k--x');
% plot(parallv2.t,parallv2.g,'r--x');
% % plot(parallv2.t,parallv3.g,'b--x');
% plot(parallv2.t,parallv4.g,'r--x');
% 
% legend('Time budget','nx6','nx13','nx14');
% ylabel('execution time');
% xlabel('Time budget');
% subplot(1,2,2)
% % plot(ref.t,ref.score,'LineWidth',1);
% hold on
% plot(parall.t,parall.score,'LineWidth',1);
% plot(parallv1.t,parallv1.score,'LineWidth',1);
% plot(parallv2.t,parallv2.score,'LineWidth',1);
% % plot(parallv2.t,parallv3.score,'LineWidth',1);
% plot(parallv2.t,parallv4.score,'LineWidth',1);
% 
% % plot(parallv2.t,log2(parallv3.n),'LineWidth',1);
% 
% legend('nx6','nx13','nx14');


figure
subplot(1,2,1)
plot(ref.t,ref.t,'k--o');
hold on
% plot(parallv2.t,parallv4.g,'r--x');

plot(test2.t,test2.g,'r--o');
ylabel('execution time');
xlabel('Time budget');
subplot(1,2,2)
plot(ref.t,ref.score,'LineWidth',1);
hold on
plot(test.t,test2.score,'LineWidth',1);
% plot(parallv2.t,parallv4.score,'LineWidth',1);


