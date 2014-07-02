#!/bin/bash

echo -e "2 cores with OpenMP Dynamic"
echo -e "high.rtpt task 1: Work = 0.009153513 sec, Span = 0.000993609 sec, Period = 0.008003584 sec"
echo -e "high.rtpt task 2: Work = 0.016187913 sec, Span = 0.001371708 sec, Period = 0.016007168 sec"
echo -e "high.rtpt task 3: Work = 0.002989620 sec, Span = 0.000199308 sec, Period = 0.002000896 sec"
echo -e "high.rtpt task 4: Work = 0.004194261 sec, Span = 0.000466029 sec, Period = 0.004001792 sec"
echo -e "high.rtpt task 5: Work = 0.002837208 sec, Span = 0.000354651 sec, Period = 0.002000896 sec"
echo -e "high.rtpt task 6: Work = 0.016620724 sec, Span = 0.003014045 sec, Period = 0.016007168 sec"

export OMP_SCHEDULE=dynamic,1

sleep 5s

./synthetic_task_utilization 12 13 0 10000 40941 3 1 0 181722 2 0 492408 25 0 319479 &
PID_1=$!

sleep 5s

./synthetic_task_utilization 14 15 0 10000 20470 2 16 0 987747 1 0 383961 &
PID_2=$!

sleep 5s

./synthetic_task_utilization 16 17 0 10000 163766 1 15 0 199308 &
PID_3=$!

sleep 5s

./synthetic_task_utilization 18 19 0 10000 81883 1 9 0 466029 &
PID_4=$!

sleep 5s

./synthetic_task_utilization 20 21 0 10000 163766 1 8 0 354651 &
PID_5=$!

sleep 5s

./synthetic_task_utilization 22 23 0 10000 20470 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186 &
PID_6=$!

wait $PID_1
wait $PID_2
wait $PID_3
wait $PID_4
wait $PID_5
wait $PID_6


