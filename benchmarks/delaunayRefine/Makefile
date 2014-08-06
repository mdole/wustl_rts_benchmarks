all:
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd incrementalRefine-cilkp; make; cd ..; \
	cd incrementalRefine-omp; make; cd ..; \

inputs:
	./geometryData/uniform -s -d 2 20 ./geometryData/data/size1-temp
	./geometryData/uniform -s -d 2 200 ./geometryData/data/size2-temp
	./geometryData/uniform -s -d 2 2000 ./geometryData/data/size3-temp
	./geometryData/uniform -s -d 2 20000 ./geometryData/data/size4-temp
	./geometryData/uniform -s -d 2 200000 ./geometryData/data/size5-temp
	./geometryData/uniform -s -d 2 2000000 ./geometryData/data/size6-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size1 ./geometryData/data/size1-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size2 ./geometryData/data/size2-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size3 ./geometryData/data/size3-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size4 ./geometryData/data/size4-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size5 ./geometryData/data/size5-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/uniform-size6 ./geometryData/data/size6-temp
	rm -f ./geometryData/data/*-temp
	./geometryData/plummer -d 2 20 ./geometryData/data/size1-temp
	./geometryData/plummer -d 2 200 ./geometryData/data/size2-temp
	./geometryData/plummer -d 2 2000 ./geometryData/data/size3-temp
	./geometryData/plummer -d 2 20000 ./geometryData/data/size4-temp
	./geometryData/plummer -d 2 200000 ./geometryData/data/size5-temp
	./geometryData/plummer -d 2 2000000 ./geometryData/data/size6-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size1 ./geometryData/data/size1-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size2 ./geometryData/data/size2-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size3 ./geometryData/data/size3-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size4 ./geometryData/data/size4-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size5 ./geometryData/data/size5-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/plummer-size6 ./geometryData/data/size6-temp
	rm -f ./geometryData/data/*-temp

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd incrementalRefine-cilkp; make clean; cd ..; \
	cd incrementalRefine-omp; make clean; cd ..; \

clean-inputs:
	rm -f ./geometryData/data/*-temp
	rm -f ./geometryData/data/*-size*
