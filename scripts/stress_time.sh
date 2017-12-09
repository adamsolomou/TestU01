mkdir -p cysg_logs
size="100"

for timebudget in $(seq 1 ${size}); do

bin/stress_std ${timebudget}	| grep 'TimeBudget\|ChosenN\|TimeUsed\|Score' >>  cysg_logs/stress_time_par_v2.log 

done