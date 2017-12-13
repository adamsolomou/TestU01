
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
test3 = readLogs('test3.log');
test4 = readLogs('test4.log');
% 
% %plot real time (absolute times)
% figure
% subplot(1,2,1)
% plot(ref.t,ref.t,'k');
% hold on
% plot(ref.t,ref.g,'k--o')
% plot(par36v2.t,par36v2.g,'b--x');
% % plot(parall.t,parall.g,'r--o');
% 
% legend('Time budget','Sequential Rabbit','Rabbit with parallelized DoMultinom');
% ylabel('Execution Time');
% xlabel('Time Budget');
% subplot(1,2,2)
% plot(ref.t,ref.score,'k-o');
% hold on
% plot(par36v2.t,par36v2.score,'b-x');
% % plot(parall.t,parall.score,'r--o');
% ylabel('Score');
% xlabel('Time Budget');
% legend('Sequential Rabbit','Rabbit with parallelized DoMultinom');
% 
% figure
% plot(ref.t,ref.t,'k');
% hold on
% plot(par36v2.t,par36v2.g,'b--x');
% plot(multi.t,multi.g,'r--o');
% legend('Time budget','Rabbit with parallelized DoMultinom','parallelized DoMulitnom only');
% ylabel('Execution Time');
% xlabel('Time Budget');
% 
% figure
% plot(ref.t,ref.t,'k');
% hold on
% plot(multi.t,multi.g,'r--o');
% plot(fourier.t,fourier.g,'-o');
% plot(lasttwo.t,lasttwo.g,'-o');
% plot(matrix.t,matrix.g,'-o');
% plot(pairs.t,pairs.g,'-o');
% plot(rest.t,rest.g,'-o');
% 
% legend('Time budget','parallelized DoMulitnom only','Task 1','Task 2','Task 3','Task 4','Task 5');
% ylabel('Execution Time');
% xlabel('Time Budget');

figure
subplot(1,2,1)
plot(ref.t,ref.t,'k');
hold on
plot(ref.t,ref.g,'k--o')
plot(par36v2.t,par36v2.g,'b--x');
plot(test1.t,test1.g,'r--o');
legend('Time budget','Sequential Rabbit','Rabbit with parallelized DoMultinom','Rabbit with parallelized tests');
ylabel('Execution Time');
xlabel('Time Budget');
subplot(1,2,2)
plot(ref.t,ref.score,'k-o');
hold on
plot(par36v2.t,par36v2.score,'b-x');
plot(test1.t,test1.score,'r--o');
plot(test3.t,test3.score,'LineWidth',1);
ylabel('Score');
xlabel('Time Budget');
legend('Sequential Rabbit','Rabbit with parallelized DoMultinom','Rabbit with parallelized tests');



figure
subplot(1,2,1)
plot(ref.t,ref.t,'k--o');
hold on
% plot(parallv2.t,parallv4.g,'r--x');

% plot(test2.t,test2.g,'r--o');
plot(test3.t,test3.g,'b--o');

plot(test4.t,test4.g,'r--o');
% 
ylabel('execution time');
xlabel('Time budget');
subplot(1,2,2)
plot(ref.t,ref.score,'LineWidth',1);
hold on
% plot(test.t,test2.score,'LineWidth',1);
% plot(parallv2.t,parallv4.score,'LineWidth',1);
plot(test3.t,test3.score,'LineWidth',1);

plot(test4.t,test4.score,'LineWidth',1);




