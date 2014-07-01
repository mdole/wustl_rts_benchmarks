
iters=100000
export OMP_SCHEDULE=dynamic,1


echo -e "low.rtpt task 1: Work = 0.007881459 sec, Span = 0.001451822 sec, Period = 0.008003584 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 5 2 0 165113 4 0 459190 14 0 212009 3 0 315571 6 0 299939

echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "low.rtpt task 1: Work = 0.001894403 sec, Span = 0.000270629 sec, Period = 0.002000896 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 1 7 0 270629

echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "low.rtpt task 1: Work = 0.001828944 sec, Span = 0.000140688 sec, Period = 0.002000896 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 1 13 0 140688

echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "low.rtpt task 1: Work = 0.001841645 sec, Span = 0.000141665 sec, Period = 0.002000896 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 1 13 0 141665

echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "low.rtpt task 1: Work = 0.001873886 sec, Span = 0.000267698 sec, Period = 0.002000896 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 1 7 0 267698

echo -e "\n-----------------------------------------------------------------------------------------------"
echo -e "low.rtpt task 1: Work = 0.003790760 sec, Span = 0.000473845 sec, Period = 0.004001792 sec \n"
./synthetic_task_utilization 12 12 0 10000 $iters 1 8 0 473845