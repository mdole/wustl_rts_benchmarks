all:
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd incrementalRefine; make; cd ..; \

inputs:
	./geometryData/uniform -f -s -d 2 20 ./geometryData/data/size1-temp
	./geometryData/uniform -f -s -d 2 200 ./geometryData/data/size2-temp
	./geometryData/uniform -f -s -d 2 2000 ./geometryData/data/size3-temp
	./geometryData/uniform -f -s -d 2 20000 ./geometryData/data/size4-temp
	./geometryData/uniform -f -s -d 2 200000 ./geometryData/data/size5-temp
	./geometryData/uniform -f -s -d 2 2000000 ./geometryData/data/size6-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size1 ./geometryData/data/size1-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size2 ./geometryData/data/size2-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size3 ./geometryData/data/size3-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size4 ./geometryData/data/size4-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size5 ./geometryData/data/size5-temp
	../delaunayTriangulation/serialDelaunay/delaunay -o ./geometryData/data/size6 ./geometryData/data/size6-temp
	rm -f ./geometryData/data/size1-temp
	rm -f ./geometryData/data/size2-temp
	rm -f ./geometryData/data/size3-temp
	rm -f ./geometryData/data/size4-temp
	rm -f ./geometryData/data/size5-temp
	rm -f ./geometryData/data/size6-temp

clean:
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd incrementalRefine; make clean; cd ..; \
	rm -f ./geometryData/data/size1-temp
	rm -f ./geometryData/data/size2-temp
	rm -f ./geometryData/data/size3-temp
	rm -f ./geometryData/data/size4-temp
	rm -f ./geometryData/data/size5-temp
	rm -f ./geometryData/data/size6-temp
	rm -f ./geometryData/data/size1
	rm -f ./geometryData/data/size2
	rm -f ./geometryData/data/size3
	rm -f ./geometryData/data/size4
	rm -f ./geometryData/data/size5
	rm -f ./geometryData/data/size6
