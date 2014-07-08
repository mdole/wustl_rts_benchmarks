all:
	cd common; make; cd ..; \
	cd deterministicHash; make; cd ..; \
	cd sequenceData; make; cd ..; \
	cd serialHash; make; cd ..; \

inputs:
	./sequenceData/randomSeq -t int 100 ./sequenceData/data/size1
	./sequenceData/randomSeq -t int 1000 ./sequenceData/data/size2
	./sequenceData/randomSeq -t int 10000 ./sequenceData/data/size3
	./sequenceData/randomSeq -t int 100000 ./sequenceData/data/size4
	./sequenceData/randomSeq -t int 1000000 ./sequenceData/data/size5
	./sequenceData/randomSeq -t int 10000000 ./sequenceData/data/size6

clean:
	cd common; make clean; cd ..; \
	cd deterministicHash; make clean; cd ..; \
	cd sequenceData; make clean; cd ..; \
	cd serialHash; make clean; cd ..; \
	rm -f ./sequenceData/data/size1
	rm -f ./sequenceData/data/size2
	rm -f ./sequenceData/data/size3
	rm -f ./sequenceData/data/size4
	rm -f ./sequenceData/data/size5
	rm -f ./sequenceData/data/size6	
