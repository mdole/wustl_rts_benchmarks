
rtptPath20=miss/bestaug5util20_taskset
resultPath20=temp_results/util20_taskset

for i in 12 13 19 37 62 67 68 90 95 
do
	mkdir -p $resultPath20$i
	./clustering_launcher $rtptPath20$i balance $resultPath20$i
done

rtptPath30=miss/bestaug5util30_taskset
resultPath30=temp_results/util30_taskset

for i in 39 48 49 56 95 98
do
	mkdir -p $resultPath30$i
	./clustering_launcher $rtptPath30$i balance $resultPath30$i
done

tar czf miss_redo_results.tar.gz temp_results 