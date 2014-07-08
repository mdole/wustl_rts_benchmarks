all:
	cd common; make; cd ..; \
	cd sampleSort-cilkp; make; cd ..; \
	cd sampleSort-omp; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialSort; make; cd ..; \

inputs:
	./sequenceData/randomSeq -t double 100 ./sequenceData/data/size1
	./sequenceData/randomSeq -t double 1000 ./sequenceData/data/size2
	./sequenceData/randomSeq -t double 10000 ./sequenceData/data/size3
	./sequenceData/randomSeq -t double 100000 ./sequenceData/data/size4
	./sequenceData/randomSeq -t double 1000000 ./sequenceData/data/size5
	./sequenceData/randomSeq -t double 10000000 ./sequenceData/data/size6

clean:
	cd common; make clean; cd ..; \
	cd sampleSort-cilkp; make clean; cd ..; \
	cd sampleSort-omp; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialSort; make clean; cd ..; \
	rm -f ./sequenceData/data/size1
	rm -f ./sequenceData/data/size2
	rm -f ./sequenceData/data/size3
	rm -f ./sequenceData/data/size4
	rm -f ./sequenceData/data/size5
	rm -f ./sequenceData/data/size6
