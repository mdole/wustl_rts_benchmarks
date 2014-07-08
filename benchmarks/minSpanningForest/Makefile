all:
	cd common; make; cd ..; \
	cd graphData; make; cd ..; \
	cd parallelKruskal; make; cd ..; \
	cd serialMST; make; cd ..; \

inputs:
	./graphData/randLocalGraph -d 3 -m 500 100 ./graphData/data/size1-temp
	./graphData/randLocalGraph -d 3 -m 5000 1000 ./graphData/data/size2-temp
	./graphData/randLocalGraph -d 3 -m 50000 10000 ./graphData/data/size3-temp
	./graphData/randLocalGraph -d 3 -m 500000 100000 ./graphData/data/size4-temp
	./graphData/randLocalGraph -d 3 -m 5000000 1000000 ./graphData/data/size5-temp
	./graphData/randLocalGraph -d 3 -m 50000000 10000000 ./graphData/data/size6-temp
	./graphData/addWeights ./graphData/data/size1-temp ./graphData/data/size1
	./graphData/addWeights ./graphData/data/size2-temp ./graphData/data/size2
	./graphData/addWeights ./graphData/data/size3-temp ./graphData/data/size3
	./graphData/addWeights ./graphData/data/size4-temp ./graphData/data/size4
	./graphData/addWeights ./graphData/data/size5-temp ./graphData/data/size5
	./graphData/addWeights ./graphData/data/size6-temp ./graphData/data/size6
	rm -f ./graphData/data/size1-temp
	rm -f ./graphData/data/size2-temp
	rm -f ./graphData/data/size3-temp
	rm -f ./graphData/data/size4-temp
	rm -f ./graphData/data/size5-temp
	rm -f ./graphData/data/size6-temp

clean:
	cd common; make clean; cd ..; \
	cd graphData; make clean; cd ..; \
	cd parallelKruskal; make clean; cd ..; \
	cd serialMST; make clean; cd ..; \
	rm -f ./graphData/data/size1
	rm -f ./graphData/data/size2
	rm -f ./graphData/data/size3
	rm -f ./graphData/data/size4
	rm -f ./graphData/data/size5
	rm -f ./graphData/data/size6
	rm -f ./graphData/data/size1-temp
	rm -f ./graphData/data/size2-temp
	rm -f ./graphData/data/size3-temp
	rm -f ./graphData/data/size4-temp
	rm -f ./graphData/data/size5-temp
	rm -f ./graphData/data/size6-temp
