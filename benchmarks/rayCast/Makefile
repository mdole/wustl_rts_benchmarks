all:
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd kdTree-cilkp; make; cd ..; \
	cd kdTree-omp; make; cd ..; \

inputs:
	bunzip2 -k ./geometryData/data/angelTriangles.bz2
	bunzip2 -k ./geometryData/data/dragonTriangles.bz2
	bunzip2 -k ./geometryData/data/happyTriangles.bz2
	./geometryData/addRays ./geometryData/data/angelTriangles ./geometryData/data/angelRays
	./geometryData/addRays ./geometryData/data/dragonTriangles ./geometryData/data/dragonRays
	./geometryData/addRays ./geometryData/data/happyTriangles ./geometryData/data/happyRays

clean:
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd kdTree-cilkp; make clean; cd ..; \
	cd kdTree-omp; make clean; cd ..; \
	rm -f ./geometryData/data/angelTriangles
	rm -f ./geometryData/data/dragonTriangles
	rm -f ./geometryData/data/happyTriangles
	rm -f ./geometryData/data/angelRays
	rm -f ./geometryData/data/dragonRays
	rm -f ./geometryData/data/happyRays
