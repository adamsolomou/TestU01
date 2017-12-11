mkdir -p cysg_logs
size="180"

for timebudget in $(seq 2 10 ${size}); do
echo ${timebudget}

bin/stress_std ${timebudget}	| grep 'TimeBudget\|ChosenN\|TimeUsed\|Score' >>  cysg_logs/stress_time_par_all_v1.log 

done
