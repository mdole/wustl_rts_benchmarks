all:
	cd common; make; cd ..; \
	cd deterministicHash-cilkp; make; cd ..; \
	cd deterministicHash-omp; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialHash; make; cd ..; \

inputs:
	./sequenceData/randomSeq -t int 100 ./sequenceData/data/randomSeq-size1
	./sequenceData/randomSeq -t int 1000 ./sequenceData/data/randomSeq-size2
	./sequenceData/randomSeq -t int 10000 ./sequenceData/data/randomSeq-size3
	./sequenceData/randomSeq -t int 100000 ./sequenceData/data/randomSeq-size4
	./sequenceData/randomSeq -t int 1000000 ./sequenceData/data/randomSeq-size5
	./sequenceData/randomSeq -t int 10000000 ./sequenceData/data/randomSeq-size6
	./sequenceData/randomSeq -t int -r 100000 100 ./sequenceData/data/randomSeq2-size1
	./sequenceData/randomSeq -t int -r 100000 1000 ./sequenceData/data/randomSeq2-size2
	./sequenceData/randomSeq -t int -r 100000 10000 ./sequenceData/data/randomSeq2-size3
	./sequenceData/randomSeq -t int -r 100000 100000 ./sequenceData/data/randomSeq2-size4
	./sequenceData/randomSeq -t int -r 100000 1000000 ./sequenceData/data/randomSeq2-size5
	./sequenceData/randomSeq -t int -r 100000 10000000 ./sequenceData/data/randomSeq2-size6
	./sequenceData/exptSeq -t int 100 ./sequenceData/data/exptSeq-size1
	./sequenceData/exptSeq -t int 1000 ./sequenceData/data/exptSeq-size2
	./sequenceData/exptSeq -t int 10000 ./sequenceData/data/exptSeq-size3
	./sequenceData/exptSeq -t int 100000 ./sequenceData/data/exptSeq-size4
	./sequenceData/exptSeq -t int 1000000 ./sequenceData/data/exptSeq-size5
	./sequenceData/exptSeq -t int 10000000 ./sequenceData/data/exptSeq-size6
	cd ./sequenceData/data; \
	../trigramSeq 100 ./trigramSeq-size1; \
	../trigramSeq 1000 ./trigramSeq-size2; \
	../trigramSeq 10000 ./trigramSeq-size3; \
	../trigramSeq 100000 ./trigramSeq-size4; \
	../trigramSeq 1000000 ./trigramSeq-size5; \
	../trigramSeq 10000000 ./trigramSeq-size6; \
	../trigramSeq 100 ./size1-temp; \
	../trigramSeq 1000 ./size2-temp; \
	../trigramSeq 10000 ./size3-temp; \
	../trigramSeq 100000 ./size4-temp; \
	../trigramSeq 1000000 ./size5-temp; \
	../trigramSeq 10000000 ./size6-temp; \
	cd ..; cd ..; \
	./sequenceData/addDataSeq -t int 100 ./sequenceData/data/size1-temp ./sequenceData/data/trigramSeq2-size1
	./sequenceData/addDataSeq -t int 1000 ./sequenceData/data/size2-temp ./sequenceData/data/trigramSeq2-size2
	./sequenceData/addDataSeq -t int 10000 ./sequenceData/data/size3-temp ./sequenceData/data/trigramSeq2-size3
	./sequenceData/addDataSeq -t int 100000 ./sequenceData/data/size4-temp ./sequenceData/data/trigramSeq2-size4
	./sequenceData/addDataSeq -t int 1000000 ./sequenceData/data/size5-temp ./sequenceData/data/trigramSeq2-size5
	./sequenceData/addDataSeq -t int 10000000 ./sequenceData/data/size6-temp ./sequenceData/data/trigramSeq2-size6
	rm -f ./sequenceData/data/*-temp

clean:
	make clean-keepinputs
	make clean-inputs

clean-keepinputs:
	cd common; make clean; cd ..; \
	cd deterministicHash-omp; make clean; cd ..; \
	cd deterministicHash-cilkp; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialHash; make clean; cd ..; \

clean-inputs:
	rm -f ./sequenceData/data/*-temp
	rm -f ./sequenceData/data/*-size*
