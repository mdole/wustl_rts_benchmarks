all:
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd incrementalMIS-cilkp; make; cd ..; \
	cd ndMIS-cilkp; make; cd ..; \
	cd incrementalMIS-omp; make; cd ..; \
	cd ndMIS-omp; make; cd ..; \
	cd serialMIS; make; cd ..; \

inputs:
	./graphData/randLocalGraph -j -d 3 -m 500 100 ./graphData/data/randLocalGraph-size1
	./graphData/randLocalGraph -j -d 3 -m 5000 1000 ./graphData/data/randLocalGraph-size2
	./graphData/randLocalGraph -j -d 3 -m 50000 10000 ./graphData/data/randLocalGraph-size3
	./graphData/randLocalGraph -j -d 3 -m 500000 100000 ./graphData/data/randLocalGraph-size4
	./graphData/randLocalGraph -j -d 3 -m 5000000 1000000 ./graphData/data/randLocalGraph-size5
	./graphData/randLocalGraph -j -d 3 -m 50000000 10000000 ./graphData/data/randLocalGraph-size6
	./graphData/rMatGraph -j -a .5 -b .1 -m 500 100 ./graphData/data/rMatGraph-size1
	./graphData/rMatGraph -j -a .5 -b .1 -m 5000 1000 ./graphData/data/rMatGraph-size2
	./graphData/rMatGraph -j -a .5 -b .1 -m 50000 10000 ./graphData/data/rMatGraph-size3
	./graphData/rMatGraph -j -a .5 -b .1 -m 500000 100000 ./graphData/data/rMatGraph-size4
	./graphData/rMatGraph -j -a .5 -b .1 -m 5000000 1000000 ./graphData/data/rMatGraph-size5
	./graphData/rMatGraph -j -a .5 -b .1 -m 50000000 10000000 ./graphData/data/rMatGraph-size6
	./graphData/gridGraph -j -d 3 100 ./graphData/data/gridGraph-size1
	./graphData/gridGraph -j -d 3 1000 ./graphData/data/gridGraph-size2
	./graphData/gridGraph -j -d 3 10000 ./graphData/data/gridGraph-size3
	./graphData/gridGraph -j -d 3 100000 ./graphData/data/gridGraph-size4
	./graphData/gridGraph -j -d 3 1000000 ./graphData/data/gridGraph-size5
	./graphData/gridGraph -j -d 3 10000000 ./graphData/data/gridGraph-size6

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd incrementalMIS-cilkp; make clean; cd ..; \
	cd ndMIS-cilkp; make clean; cd ..; \
	cd incrementalMIS-omp; make clean; cd ..; \
	cd ndMIS-omp; make clean; cd ..; \
	cd serialMIS; make clean; cd ..; \

clean-inputs:
	rm -f ./graphData/data/*-size*
