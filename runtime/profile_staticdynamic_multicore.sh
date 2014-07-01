# program_name first_core last_core bucket_width_sec bucket_width_ns num_repetitions args

iters=1000


echo -e "high.rtpt task 1: Work = 0.009153513 sec, Span = 0.000993609 sec, Period = 0.008003584 sec \n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 3 1 0 181722 2 0 492408 25 0 319479


echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "high.rtpt task 2: Work = 0.016187913 sec, Span = 0.001371708 sec, Period = 0.016007168 sec \n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 2 16 0 987747 1 0 383961
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 2 16 0 987747 1 0 383961

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 2 16 0 987747 1 0 383961
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 2 16 0 987747 1 0 383961

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 2 16 0 987747 1 0 383961
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 2 16 0 987747 1 0 383961


echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "high.rtpt task 3: Work = 0.002989620 sec, Span = 0.000199308 sec, Period = 0.002000896 sec \n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 15 0 199308
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 15 0 199308

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 15 0 199308
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 15 0 199308

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 15 0 199308
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 15 0 199308


echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "high.rtpt task 4: Work = 0.004194261 sec, Span = 0.000466029 sec, Period = 0.004001792 sec \n\n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 9 0 466029
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 9 0 466029

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 9 0 466029
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 9 0 466029

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 9 0 466029
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 9 0 466029


echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "high.rtpt task 5: Work = 0.002837208 sec, Span = 0.000354651 sec, Period = 0.002000896 sec \n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 8 0 354651
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 1 8 0 354651

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 8 0 354651
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 1 8 0 354651

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 8 0 354651
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 1 8 0 354651


echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "high.rtpt task 6: Work = 0.016620724 sec, Span = 0.003014045 sec, Period = 0.016007168 sec \n"

echo -e "2 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 13 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 13 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186

echo -e "6 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 17 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 17 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186

echo -e "12 cores \n"
echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./synthetic_task_utilization 12 23 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186
echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./synthetic_task_utilization 12 23 0 10000 $iters 8 8 0 226664 2 0 214940 1 0 394708 2 0 406432 5 0 290169 2 0 426949 5 0 254997 12 0 799186

