mkdir -p cysg_logs
size="100"

for timebudget in $(seq 2 ${size}); do
echo ${timebudget}
bin/stress_std ${timebudget}	| grep 'TimeBudget\|ChosenN\|TimeUsed\|Score' >>  cysg_logs/stress_time_tbb.log 

done
