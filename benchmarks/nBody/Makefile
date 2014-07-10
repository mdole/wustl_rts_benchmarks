all:
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd parallelCK-cilkp; make; cd ..; \
	cd parallelCK-omp; make; cd ..; \

inputs:
	./geometryData/uniform -f -s -d 3 10 ./geometryData/data/size1
	./geometryData/uniform -f -s -d 3 100 ./geometryData/data/size2
	./geometryData/uniform -f -s -d 3 1000 ./geometryData/data/size3
	./geometryData/uniform -f -s -d 3 10000 ./geometryData/data/size4
	./geometryData/uniform -f -s -d 3 100000 ./geometryData/data/size5
	./geometryData/uniform -f -s -d 3 1000000 ./geometryData/data/size6

clean:
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd parallelCK-cilkp; make clean; cd ..; \
	cd parallelCK-omp; make clean; cd ..; \
	rm -f ./geometryData/data/size1
	rm -f ./geometryData/data/size2
	rm -f ./geometryData/data/size3
	rm -f ./geometryData/data/size4
	rm -f ./geometryData/data/size5
	rm -f ./geometryData/data/size6
