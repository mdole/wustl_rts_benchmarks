all:
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd incrementalMIS-cilkp; make; cd ..; \
	cd ndMIS-cilkp; make; cd ..; \
	cd incrementalMIS-omp; make; cd ..; \
	cd ndMIS-omp; make; cd ..; \
	cd serialMIS; make; cd ..; \

inputs:
	./graphData/randLocalGraph -j -d 3 -m 500 100 ./graphData/data/size1
	./graphData/randLocalGraph -j -d 3 -m 5000 1000 ./graphData/data/size2
	./graphData/randLocalGraph -j -d 3 -m 50000 10000 ./graphData/data/size3
	./graphData/randLocalGraph -j -d 3 -m 500000 100000 ./graphData/data/size4
	./graphData/randLocalGraph -j -d 3 -m 5000000 1000000 ./graphData/data/size5
	./graphData/randLocalGraph -j -d 3 -m 50000000 10000000 ./graphData/data/size6

clean:
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd incrementalMIS-cilkp; make clean; cd ..; \
	cd ndMIS-cilkp; make clean; cd ..; \
	cd incrementalMIS-omp; make clean; cd ..; \
	cd ndMIS-omp; make clean; cd ..; \
	cd serialMIS; make clean; cd ..; \
	rm -f ./graphData/data/size1
	rm -f ./graphData/data/size2
	rm -f ./graphData/data/size3
	rm -f ./graphData/data/size4
	rm -f ./graphData/data/size5
	rm -f ./graphData/data/size6
