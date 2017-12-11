
clear all;

ref = readLogs('stress_time_ref.log');
parall = readLogs('stress_time_par_all.log');
par2 = readLogs('stress_time_par2.log');
par36v2 = readLogs('stress_time_par36_v2.log');
multi = readLogs('stress_time_multi.log');
fourier = readLogs('stress_time_fourier.log');
lasttwo = readLogs('stress_time_lasttwo.log');
matrix = readLogs('stress_time_matrix.log');
pairs = readLogs('stress_time_pairs.log');
rest = readLogs('stress_time_rest.log');

multi24 = readLogs('stress_time_multi24.log');

figure
plot(ref.t,ref.t,'k--o');
hold on
plot(multi.t,multi.g,'--o');
plot(fourier.t,fourier.g,'--o');
plot(lasttwo.t,lasttwo.g,'--o');
plot(matrix.t,matrix.g,'--o');
plot(pairs.t,pairs.g,'--o');
plot(rest.t,rest.g,'--o');

figure
plot(multi24.t,multi24.g,'--o');
hold on
plot(multi.t,multi.g,'--o');

%plot real time (absolute times)
figure
subplot(1,2,1)
plot(ref.t,ref.t,'k--o');
hold on
plot(ref.t,ref.g,'b--o')
plot(par36v2.t,par36v2.g,'b--x');
plot(par2.t,par2.g,'r--x');

% plot(parall.t,parall.g,'r--o');
legend('Time budget','sequential','2 tasks');
ylabel('execution time');
xlabel('Time budget');
subplot(1,2,2)
plot(ref.t,ref.score,'LineWidth',1);
hold on
% plot(parall.t,parall.score,'LineWidth',1);
plot(par36v2.t,par36v2.score,'LineWidth',1);

plot(par2.t,par2.score,'LineWidth',1);
