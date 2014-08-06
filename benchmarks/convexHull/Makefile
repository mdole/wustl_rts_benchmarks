all:
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd quickHull-cilkp; make; cd ..; \
	cd quickHull-omp; make; cd ..; \

inputs:
	./geometryData/uniform -s -d 2 100 ./geometryData/data/uniform-size1
	./geometryData/uniform -s -d 2 1000 ./geometryData/data/uniform-size2
	./geometryData/uniform -s -d 2 10000 ./geometryData/data/uniform-size3
	./geometryData/uniform -s -d 2 100000 ./geometryData/data/uniform-size4
	./geometryData/uniform -s -d 2 1000000 ./geometryData/data/uniform-size5
	./geometryData/uniform -s -d 2 10000000 ./geometryData/data/uniform-size6
	./geometryData/plummer -d 2 100 ./geometryData/data/plummer-size1
	./geometryData/plummer -d 2 1000 ./geometryData/data/plummer-size2
	./geometryData/plummer -d 2 10000 ./geometryData/data/plummer-size3
	./geometryData/plummer -d 2 100000 ./geometryData/data/plummer-size4
	./geometryData/plummer -d 2 1000000 ./geometryData/data/plummer-size5
	./geometryData/plummer -d 2 10000000 ./geometryData/data/plummer-size6
	./geometryData/uniform -S -d 2 100 ./geometryData/data/uniform2-size1
	./geometryData/uniform -S -d 2 1000 ./geometryData/data/uniform2-size2
	./geometryData/uniform -S -d 2 10000 ./geometryData/data/uniform2-size3
	./geometryData/uniform -S -d 2 100000 ./geometryData/data/uniform2-size4
	./geometryData/uniform -S -d 2 1000000 ./geometryData/data/uniform2-size5
	./geometryData/uniform -S -d 2 10000000 ./geometryData/data/uniform2-size6

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd quickHull-cilkp; make clean; cd ..; \
	cd quickHull-omp; make clean; cd ..; \

clean-inputs:
	rm -f ./geometryData/data/*-size*
