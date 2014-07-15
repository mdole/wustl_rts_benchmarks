all:
	cd runtime; make; cd ..; \
	cd benchmarks; \
	cd breadthFirstSearch; make& cd ..; \
	cd comparisonSort; make& cd ..; \
	cd convexHull; make& cd ..; \
	cd delaunayRefine; make& cd ..; \
	cd delaunayTriangulation; make& cd ..; \
	cd dictionary; make& cd ..; \
	cd maximalIndependentSet; make& cd ..; \
	cd minSpanningForest; make& cd ..; \
	cd nBody; make& cd ..; \
	cd rayCast; make& cd ..; \
	cd removeDuplicates; make& cd ..; \
	wait; \
	cd ..

serial:
	cd runtime; make&& cd ..; \
	cd benchmarks; \
	cd breadthFirstSearch; make&& cd ..; \
	cd comparisonSort; make&& cd ..; \
	cd convexHull; make&& cd ..; \
	cd delaunayRefine; make&& cd ..; \
	cd delaunayTriangulation; make&& cd ..; \
	cd dictionary; make&& cd ..; \
	cd maximalIndependentSet; make&& cd ..; \
	cd minSpanningForest; make&& cd ..; \
	cd nBody; make&& cd ..; \
	cd rayCast; make&& cd ..; \
	cd removeDuplicates; make&& cd ..; \
	cd ..

inputs:
	cd benchmarks; \
	cd breadthFirstSearch; make inputs; cd ..; \
	cd comparisonSort; make inputs; cd ..; \
	cd convexHull; make inputs; cd ..; \
	cd delaunayRefine; make inputs; cd ..; \
	cd dictionary; make inputs; cd ..; \
	cd maximalIndependentSet; make inputs; cd ..; \
	cd minSpanningForest; make inputs; cd ..; \
	cd nBody; make inputs; cd ..; \
	cd rayCast; make inputs; cd ..; \
	cd removeDuplicates; make inputs; cd ..; \
	cd ..

clean:
	cd runtime; make clean; cd ..; \
	cd benchmarks; \
	cd breadthFirstSearch; make clean; cd ..; \
	cd comparisonSort; make clean; cd ..; \
	cd convexHull; make clean; cd ..; \
	cd delaunayRefine; make clean; cd ..; \
	cd delaunayTriangulation; make clean; cd ..; \
	cd dictionary; make clean; cd ..; \
	cd maximalIndependentSet; make clean; cd ..; \
	cd minSpanningForest; make clean; cd ..; \
	cd nBody; make clean; cd ..; \
	cd rayCast; make clean; cd ..; \
	cd removeDuplicates; make clean; cd ..; \
	cd ..
