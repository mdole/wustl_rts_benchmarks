#!/bin/bash

sleep 10s

echo -e "high.rtpt \n"

echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./clustering_launcher high balance

sleep 10s

echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./clustering_launcher high balance

sleep 10s

echo -e "low.rtpt \n"

echo -e "With OpenMP Static \n"
export OMP_SCHEDULE=static,1
./clustering_launcher low balance

sleep 10s

echo -e "With OpenMP Dynamic \n"
export OMP_SCHEDULE=dynamic,1
./clustering_launcher low balance 