all:
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd parallelKruskal-cilkp; make; cd ..; \
	cd parallelKruskal-omp; make; cd ..; \
	cd serialMST; make; cd ..; \

inputs:
	./graphData/randLocalGraph -d 3 -m 500 100 ./graphData/data/size1-temp
	./graphData/randLocalGraph -d 3 -m 5000 1000 ./graphData/data/size2-temp
	./graphData/randLocalGraph -d 3 -m 50000 10000 ./graphData/data/size3-temp
	./graphData/randLocalGraph -d 3 -m 500000 100000 ./graphData/data/size4-temp
	./graphData/randLocalGraph -d 3 -m 5000000 1000000 ./graphData/data/size5-temp
	./graphData/randLocalGraph -d 3 -m 50000000 10000000 ./graphData/data/size6-temp
	./graphData/addWeights ./graphData/data/size1-temp ./graphData/data/randLocalGraph-size1
	./graphData/addWeights ./graphData/data/size2-temp ./graphData/data/randLocalGraph-size2
	./graphData/addWeights ./graphData/data/size3-temp ./graphData/data/randLocalGraph-size3
	./graphData/addWeights ./graphData/data/size4-temp ./graphData/data/randLocalGraph-size4
	./graphData/addWeights ./graphData/data/size5-temp ./graphData/data/randLocalGraph-size5
	./graphData/addWeights ./graphData/data/size6-temp ./graphData/data/randLocalGraph-size6
	rm -f ./graphData/data/*-temp
	./graphData/rMatGraph -a .5 -b .1 -m 500 100 ./graphData/data/size1-temp
	./graphData/rMatGraph -a .5 -b .1 -m 5000 1000 ./graphData/data/size2-temp
	./graphData/rMatGraph -a .5 -b .1 -m 50000 10000 ./graphData/data/size3-temp
	./graphData/rMatGraph -a .5 -b .1 -m 500000 100000 ./graphData/data/size4-temp
	./graphData/rMatGraph -a .5 -b .1 -m 5000000 1000000 ./graphData/data/size5-temp
	./graphData/rMatGraph -a .5 -b .1 -m 50000000 10000000 ./graphData/data/size6-temp
	./graphData/addWeights ./graphData/data/size1-temp ./graphData/data/rMatGraph-size1
	./graphData/addWeights ./graphData/data/size2-temp ./graphData/data/rMatGraph-size2
	./graphData/addWeights ./graphData/data/size3-temp ./graphData/data/rMatGraph-size3
	./graphData/addWeights ./graphData/data/size4-temp ./graphData/data/rMatGraph-size4
	./graphData/addWeights ./graphData/data/size5-temp ./graphData/data/rMatGraph-size5
	./graphData/addWeights ./graphData/data/size6-temp ./graphData/data/rMatGraph-size6
	rm -f ./graphData/data/*-temp
	./graphData/gridGraph -d 2 500 100 ./graphData/data/size1-temp
	./graphData/gridGraph -d 2 5000 1000 ./graphData/data/size2-temp
	./graphData/gridGraph -d 2 50000 10000 ./graphData/data/size3-temp
	./graphData/gridGraph -d 2 500000 100000 ./graphData/data/size4-temp
	./graphData/gridGraph -d 2 5000000 1000000 ./graphData/data/size5-temp
	./graphData/gridGraph -d 2 50000000 10000000 ./graphData/data/size6-temp
	./graphData/addWeights ./graphData/data/size1-temp ./graphData/data/gridGraph-size1
	./graphData/addWeights ./graphData/data/size2-temp ./graphData/data/gridGraph-size2
	./graphData/addWeights ./graphData/data/size3-temp ./graphData/data/gridGraph-size3
	./graphData/addWeights ./graphData/data/size4-temp ./graphData/data/gridGraph-size4
	./graphData/addWeights ./graphData/data/size5-temp ./graphData/data/gridGraph-size5
	./graphData/addWeights ./graphData/data/size6-temp ./graphData/data/gridGraph-size6
	rm -f ./graphData/data/*-temp

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd parallelKruskal-cilkp; make clean; cd ..; \
	cd parallelKruskal-omp; make clean; cd ..; \
	cd serialMST; make clean; cd ..; \

clean-inputs:
	rm -f ./graphData/data/*-temp
	rm -f ./graphData/data/*-size*
