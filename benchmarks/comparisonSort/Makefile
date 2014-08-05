all:
	cd common; make; cd ..; \
	cd sampleSort-cilkp; make; cd ..; \
	cd sampleSort-omp; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialSort; make; cd ..; \

inputs:
	./sequenceData/randomSeq -t double 100 ./sequenceData/data/randomSeq-size1
	./sequenceData/randomSeq -t double 1000 ./sequenceData/data/randomSeq-size2
	./sequenceData/randomSeq -t double 10000 ./sequenceData/data/randomSeq-size3
	./sequenceData/randomSeq -t double 100000 ./sequenceData/data/randomSeq-size4
	./sequenceData/randomSeq -t double 1000000 ./sequenceData/data/randomSeq-size5
	./sequenceData/randomSeq -t double 10000000 ./sequenceData/data/randomSeq-size6
	./sequenceData/exptSeq -t double 100 ./sequenceData/data/exptSeq-size1
	./sequenceData/exptSeq -t double 1000 ./sequenceData/data/exptSeq-size2
	./sequenceData/exptSeq -t double 10000 ./sequenceData/data/exptSeq-size3
	./sequenceData/exptSeq -t double 100000 ./sequenceData/data/exptSeq-size4
	./sequenceData/exptSeq -t double 1000000 ./sequenceData/data/exptSeq-size5
	./sequenceData/exptSeq -t double 10000000 ./sequenceData/data/exptSeq-size6
	./sequenceData/almostSortedSeq -t double 100 ./sequenceData/data/almostSortedSeq-size1
	./sequenceData/almostSortedSeq -t double 1000 ./sequenceData/data/almostSortedSeq-size2
	./sequenceData/almostSortedSeq -t double 10000 ./sequenceData/data/almostSortedSeq-size3
	./sequenceData/almostSortedSeq -t double 100000 ./sequenceData/data/almostSortedSeq-size4
	./sequenceData/almostSortedSeq -t double 1000000 ./sequenceData/data/almostSortedSeq-size5
	./sequenceData/almostSortedSeq -t double 10000000 ./sequenceData/data/almostSortedSeq-size6
	cd ./sequenceData/data; \
	../trigramSeq 100 ./trigramSeq-size1; \
	../trigramSeq 1000 ./trigramSeq-size2; \
	../trigramSeq 10000 ./trigramSeq-size3; \
	../trigramSeq 100000 ./trigramSeq-size4; \
	../trigramSeq 1000000 ./trigramSeq-size5; \
	../trigramSeq 10000000 ./trigramSeq-size6; \
	cd ..; cd ..; \

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd sampleSort-cilkp; make clean; cd ..; \
	cd sampleSort-omp; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialSort; make clean; cd ..; \

clean-inputs:
	rm -f ./sequenceData/data/*-size*
