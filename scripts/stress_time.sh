mkdir -p cysg_logs
size="180"

for timebudget in $(seq 2 ${size}); do

bin/stress_std ${timebudget}	| grep 'TimeBudget\|ChosenN\|TimeUsed\|Score' >>  cysg_logs/stress_time_ref.log 

done