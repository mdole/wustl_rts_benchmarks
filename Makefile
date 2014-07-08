all:
	cd runtime; make; cd ..; \
	cd benchmarks; \
	cd breadthFirstSearch; \
	cd common; make; cd ..; \
	cd deterministicBFS; make; cd ..; \
	cd graphData; make; cd ..; \
	cd serialBFS; make; cd ..; \
	cd ..; \
	cd comparisonSort; \
	cd common; make; cd ..; \
	cd sampleSort-cilkp; make; cd ..; \
	cd sampleSort-omp; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialSort; make; cd ..; \
	cd ..; \
	cd convexHull; \
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd quickHull-cilkp; make; cd ..; \
	cd quickHull-omp; make; cd ..; \
	cd ..; \
	cd delaunayRefine; \
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd incrementalRefine; make; cd ..; \
	cd ..; \
	cd delaunayTriangulation; \
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd serialDelaunay; make; cd ..; \
	cd ..; \
	cd dictionary; \
	cd common; make; cd ..; \
	cd deterministicHash; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialHash; make; cd ..; \
	cd ..; \
	cd maximalIndependentSet; \
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd incrementalMIS; make; cd ..; \
	cd ndMIS; make; cd ..; \
	cd serialMIS; make; cd ..; \
	cd ..; \
	cd minSpanningForest; \
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd parallelKruskal; make; cd ..; \
	cd serialMST; make; cd ..; \
	cd ..; \
	cd nBody; \
	cd common; make; cd ..; \
	cd geometryData; make; cd ..; \
	cd parallelCK; make; cd ..; \
	cd ..; \
	cd removeDuplicates; \
	cd common; make; cd ..; \
	cd deterministicHash; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialHash; make; cd ..; \
	cd ..; \
	cd ..; \

inputs:
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 500 100 ./benchmarks/breadthFirstSearch/graphData/data/size1
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 5000 1000 ./benchmarks/breadthFirstSearch/graphData/data/size2
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 50000 10000 ./benchmarks/breadthFirstSearch/graphData/data/size3
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 500000 100000 ./benchmarks/breadthFirstSearch/graphData/data/size4
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 5000000 1000000 ./benchmarks/breadthFirstSearch/graphData/data/size5
	./benchmarks/breadthFirstSearch/graphData/randLocalGraph -j -d 3 -m 50000000 10000000 ./benchmarks/breadthFirstSearch/graphData/data/size6
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 100 ./benchmarks/comparisonSort/sequenceData/data/size1
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 1000 ./benchmarks/comparisonSort/sequenceData/data/size2
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 10000 ./benchmarks/comparisonSort/sequenceData/data/size3
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 100000 ./benchmarks/comparisonSort/sequenceData/data/size4
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 1000000 ./benchmarks/comparisonSort/sequenceData/data/size5
	./benchmarks/comparisonSort/sequenceData/randomSeq -t double 10000000 ./benchmarks/comparisonSort/sequenceData/data/size6
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 100 ./benchmarks/convexHull/geometryData/data/size1
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 1000 ./benchmarks/convexHull/geometryData/data/size2
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 10000 ./benchmarks/convexHull/geometryData/data/size3
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 100000 ./benchmarks/convexHull/geometryData/data/size4
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 1000000 ./benchmarks/convexHull/geometryData/data/size5
	./benchmarks/convexHull/geometryData/uniform -f -s -d 2 10000000 ./benchmarks/convexHull/geometryData/data/size6
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 20 ./benchmarks/delaunayRefine/geometryData/data/size1-temp
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 200 ./benchmarks/delaunayRefine/geometryData/data/size2-temp
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 2000 ./benchmarks/delaunayRefine/geometryData/data/size3-temp
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 20000 ./benchmarks/delaunayRefine/geometryData/data/size4-temp
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 200000 ./benchmarks/delaunayRefine/geometryData/data/size5-temp
	./benchmarks/delaunayRefine/geometryData/uniform -f -s -d 2 2000000 ./benchmarks/delaunayRefine/geometryData/data/size6-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size1 ./benchmarks/delaunayRefine/geometryData/data/size1-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size2 ./benchmarks/delaunayRefine/geometryData/data/size2-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size3 ./benchmarks/delaunayRefine/geometryData/data/size3-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size4 ./benchmarks/delaunayRefine/geometryData/data/size4-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size5 ./benchmarks/delaunayRefine/geometryData/data/size5-temp
	./benchmarks/delaunayTriangulation/serialDelaunay/delaunay -o ./benchmarks/delaunayRefine/geometryData/data/size6 ./benchmarks/delaunayRefine/geometryData/data/size6-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size1-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size2-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size3-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size4-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size5-temp
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size6-temp
	./benchmarks/dictionary/sequenceData/randomSeq -t int 100 ./benchmarks/dictionary/sequenceData/data/size1
	./benchmarks/dictionary/sequenceData/randomSeq -t int 1000 ./benchmarks/dictionary/sequenceData/data/size2
	./benchmarks/dictionary/sequenceData/randomSeq -t int 10000 ./benchmarks/dictionary/sequenceData/data/size3
	./benchmarks/dictionary/sequenceData/randomSeq -t int 100000 ./benchmarks/dictionary/sequenceData/data/size4
	./benchmarks/dictionary/sequenceData/randomSeq -t int 1000000 ./benchmarks/dictionary/sequenceData/data/size5
	./benchmarks/dictionary/sequenceData/randomSeq -t int 10000000 ./benchmarks/dictionary/sequenceData/data/size6
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 500 100 ./benchmarks/maximalIndependentSet/graphData/data/size1
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 5000 1000 ./benchmarks/maximalIndependentSet/graphData/data/size2
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 50000 10000 ./benchmarks/maximalIndependentSet/graphData/data/size3
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 500000 100000 ./benchmarks/maximalIndependentSet/graphData/data/size4
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 5000000 1000000 ./benchmarks/maximalIndependentSet/graphData/data/size5
	./benchmarks/maximalIndependentSet/graphData/randLocalGraph -j -d 3 -m 50000000 10000000 ./benchmarks/maximalIndependentSet/graphData/data/size6
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 500 100 ./benchmarks/minSpanningForest/graphData/data/size1-temp
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 5000 1000 ./benchmarks/minSpanningForest/graphData/data/size2-temp
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 50000 10000 ./benchmarks/minSpanningForest/graphData/data/size3-temp
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 500000 100000 ./benchmarks/minSpanningForest/graphData/data/size4-temp
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 5000000 1000000 ./benchmarks/minSpanningForest/graphData/data/size5-temp
	./benchmarks/minSpanningForest/graphData/randLocalGraph -d 3 -m 50000000 10000000 ./benchmarks/minSpanningForest/graphData/data/size6-temp
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size1-temp ./benchmarks/minSpanningForest/graphData/data/size1
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size2-temp ./benchmarks/minSpanningForest/graphData/data/size2
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size3-temp ./benchmarks/minSpanningForest/graphData/data/size3
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size4-temp ./benchmarks/minSpanningForest/graphData/data/size4
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size5-temp ./benchmarks/minSpanningForest/graphData/data/size5
	./benchmarks/minSpanningForest/graphData/addWeights ./benchmarks/minSpanningForest/graphData/data/size6-temp ./benchmarks/minSpanningForest/graphData/data/size6
	rm -f ./benchmarks/minSpanningForest/graphData/data/size1-temp
	rm -f ./benchmarks/minSpanningForest/graphData/data/size2-temp
	rm -f ./benchmarks/minSpanningForest/graphData/data/size3-temp
	rm -f ./benchmarks/minSpanningForest/graphData/data/size4-temp
	rm -f ./benchmarks/minSpanningForest/graphData/data/size5-temp
	rm -f ./benchmarks/minSpanningForest/graphData/data/size6-temp
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 10 ./benchmarks/nBody/geometryData/data/size1
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 100 ./benchmarks/nBody/geometryData/data/size2
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 1000 ./benchmarks/nBody/geometryData/data/size3
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 10000 ./benchmarks/nBody/geometryData/data/size4
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 100000 ./benchmarks/nBody/geometryData/data/size5
	./benchmarks/nBody/geometryData/uniform -f -s -d 3 1000000 ./benchmarks/nBody/geometryData/data/size6
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 100 ./benchmarks/removeDuplicates/sequenceData/data/size1
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 1000 ./benchmarks/removeDuplicates/sequenceData/data/size2
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 10000 ./benchmarks/removeDuplicates/sequenceData/data/size3
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 100000 ./benchmarks/removeDuplicates/sequenceData/data/size4
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 1000000 ./benchmarks/removeDuplicates/sequenceData/data/size5
	./benchmarks/removeDuplicates/sequenceData/randomSeq -t int 10000000 ./benchmarks/removeDuplicates/sequenceData/data/size6

clean:
	cd runtime; make clean; cd ..; \
	cd benchmarks; \
	cd breadthFirstSearch; \
	cd common; make clean; cd ..; \
	cd deterministicBFS; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd serialBFS; make clean; cd ..; \
	cd ..; \
	cd comparisonSort; \
	cd common; make clean; cd ..; \
	cd sampleSort-cilkp; make clean; cd ..; \
	cd sampleSort-omp; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialSort; make clean; cd ..; \
	cd ..; \
	cd convexHull; \
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd quickHull-cilkp; make clean; cd ..; \
	cd quickHull-omp; make clean; cd ..; \
	cd ..; \
	cd delaunayRefine; \
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd incrementalRefine; make clean; cd ..; \
	cd ..; \
	cd delaunayTriangulation; \
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd serialDelaunay; make clean; cd ..; \
	cd ..; \
	cd dictionary; \
	cd common; make clean; cd ..; \
	cd deterministicHash; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialHash; make clean; cd ..; \
	cd ..; \
	cd maximalIndependentSet; \
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd incrementalMIS; make clean; cd ..; \
	cd ndMIS; make clean; cd ..; \
	cd serialMIS; make clean; cd ..; \
	cd ..; \
	cd minSpanningForest; \
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd parallelKruskal; make clean; cd ..; \
	cd serialMST; make clean; cd ..; \
	cd ..; \
	cd nBody; \
	cd common; make clean; cd ..; \
	cd geometryData; make clean; cd ..; \
	cd parallelCK; make clean; cd ..; \
	cd ..; \
	cd removeDuplicates; \
	cd common; make clean; cd ..; \
	cd deterministicHash; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialHash; make clean; cd ..; \
	cd ..; \
	cd ..; \
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size1
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size2
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size3
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size4
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size5
	rm -f ./benchmarks/breadthFirstSearch/graphData/data/size6
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size1
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size2
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size3
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size4
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size5
	rm -f ./benchmarks/comparisonSort/sequenceData/data/size6
	rm -f ./benchmarks/convexHull/geometryData/data/size1
	rm -f ./benchmarks/convexHull/geometryData/data/size2
	rm -f ./benchmarks/convexHull/geometryData/data/size3
	rm -f ./benchmarks/convexHull/geometryData/data/size4
	rm -f ./benchmarks/convexHull/geometryData/data/size5
	rm -f ./benchmarks/convexHull/geometryData/data/size6
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size1
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size2
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size3
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size4
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size5
	rm -f ./benchmarks/delaunayRefine/geometryData/data/size6
	rm -f ./benchmarks/dictionary/sequenceData/data/size1
	rm -f ./benchmarks/dictionary/sequenceData/data/size2
	rm -f ./benchmarks/dictionary/sequenceData/data/size3
	rm -f ./benchmarks/dictionary/sequenceData/data/size4
	rm -f ./benchmarks/dictionary/sequenceData/data/size5
	rm -f ./benchmarks/dictionary/sequenceData/data/size6
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size1
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size2
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size3
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size4
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size5
	rm -f ./benchmarks/maximalIndependentSet/graphData/data/size6
	rm -f ./benchmarks/minSpanningForest/graphData/data/size1
	rm -f ./benchmarks/minSpanningForest/graphData/data/size2
	rm -f ./benchmarks/minSpanningForest/graphData/data/size3
	rm -f ./benchmarks/minSpanningForest/graphData/data/size4
	rm -f ./benchmarks/minSpanningForest/graphData/data/size5
	rm -f ./benchmarks/minSpanningForest/graphData/data/size6
	rm -f ./benchmarks/nBody/geometryData/data/size1
	rm -f ./benchmarks/nBody/geometryData/data/size2
	rm -f ./benchmarks/nBody/geometryData/data/size3
	rm -f ./benchmarks/nBody/geometryData/data/size4
	rm -f ./benchmarks/nBody/geometryData/data/size5
	rm -f ./benchmarks/nBody/geometryData/data/size6
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size1
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size2
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size3
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size4
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size5
	rm -f ./benchmarks/removeDuplicates/sequenceData/data/size6	
