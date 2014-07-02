#!/usr/bin/python

import re
import sys
import glob
import math
import subprocess
import time

def toTimespecStr(timeStr, timeScaleInNSec):
    nsec = int(timeStr) * int(timeScaleInNSec)
    nsecPerSec = 1000000000
    sec = nsec // nsecPerSec
    nsec = nsec % nsecPerSec
    return str(sec) + " " + str(nsec)
    
def main():
    if len(sys.argv) != 1: raise Exception("Wrong number of arguments")
    totalTime = 65536 * 5
    
    for n in [ 512, 1024 ]:
        timeScaleInNSec = math.ceil(999999.0 / n)

        for numCores in [ 1, 2, 3, 4 ]:
            tasksetDir = "/export/austen/home/kieselbachk/cores" + str(numCores) + "_tasks108"
            outputName = "overhead_measurements/overhead_timescale" + str(n) + "_cores" + str(numCores) + ".txt"
            
            with open(outputName, 'w') as output:
                firstCore = 12
                lastCore = firstCore + numCores - 1
                executingProcs = []
                maxNumExecuting = int(36 / numCores)
                
                for taskFile in sorted(glob.glob(tasksetDir + "/task*.txt")):
                
                    if len(executingProcs) == maxNumExecuting:
                        for proc in executingProcs:
                            proc.wait()
                        firstCore = 12
                        lastCore = firstCore + numCores - 1
                        executingProcs = []
                
                    with open(taskFile, 'r') as f:
                        lines = f.readlines()
                    if len(lines) == 0: raise Exception("Bad task file: " + taskFile)
                    
                    m = re.match(r"^\s*(?P<period>\d+)\s+(?P<numSegments>\d+)\s*$", lines[0])
                    if m == None: raise Exception("Bad task file: " + taskFile)
                    period, numSegments = m.groups()
                    args = [ numSegments ]
                    if (len(lines) != 2*int(numSegments) + 1): raise Exception("Bad task file: " + taskFile)
                    
                    executionTime = 0
                    for i in range(0, int(numSegments)):
                        m = re.match(r"^\s*(?P<numStrands>\d+)\s+(?P<segmentLength>\d+)\s+(?P<priority>\d+)\s+(?P<release>(\d+.\d+)|\d+)\s*$", lines[1 + 2*i])
                        if m == None: raise Exception("Bad task file: " + taskFile)
                        numStrands, segmentLength = m.group(1, 2)
                        args.append(numStrands)
                        args += toTimespecStr(segmentLength, timeScaleInNSec).split()
                        executionTime += int(math.ceil(float(numStrands)/numCores)) * int(segmentLength)
                        
                        m = re.match(r"^\s*(\d+\s*){" + numStrands + "}$", lines[2 + 2*i])
                        if m == None: raise Exception("Bad task file: " + taskFile)
                        
                    numIters = int((float(totalTime) * 1000000) / (int(period) * int(timeScaleInNSec)))
                    
                    command = [ "./synthetic_task_utilization", str(firstCore), str(lastCore) ] + toTimespecStr(executionTime, timeScaleInNSec).split() + [ str(numIters) ] + args
                    executingProcs.append(subprocess.Popen(command, stdout=output))
                    firstCore += numCores
                    lastCore += numCores
                    time.sleep(10)
                    
                for proc in executingProcs:
                    proc.wait()
    
    subprocess.call("tar czf overhead_measurements.tar.gz overhead_measurements".split())
                    
main()

