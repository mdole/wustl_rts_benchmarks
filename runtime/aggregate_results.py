#!/usr/bin/python

import re
import sys
import glob

def main():
    if len(sys.argv) < 3: raise Exception("Too few arguments")

    filenameArg = sys.argv[1].rpartition(".")
    if filenameArg[1] == ".":
        outputFilename = (filenameArg[0], "." + filenameArg[2])
    else:
        outputFilename = (filenameArg[2], ".txt")
    
    with open(outputFilename[0] + outputFilename[1], 'w') as output:    
        with open(outputFilename[0] + "_verbose" + outputFilename[1], 'w') as verboseOutput:
            for experimentDir in sys.argv[2:]:
                experimentPath = experimentDir.split("/")
                output.write(experimentPath[-1] + "\n")
                verboseOutput.write(experimentPath[-1] + "\n")
            
                numTotalTasksets = 0
                numTotalFailures = 0
                numTotalPeriods = 0
                numTotalMissedDeadlines = 0
                
                numSchedulableTasksets = 0
                numSchedulableFailures = 0
                numSchedulablePeriods = 0
                numSchedulableMissedDeadlines = 0
                
                numNotGuaranteedTasksets = 0
                numNotGuaranteedFailures = 0
                numNotGuaranteedPeriods = 0
                numNotGuaranteedMissedDeadlines = 0
                
                numUnschedulableTasksets = 0
                
                for tasksetDir in sorted(glob.glob(experimentDir + "/taskset*")):
                    tasksetPath = tasksetDir.split("/")
                    verboseOutput.write("\t" + tasksetPath[-1] + ": ")
                
                    schedulabilityFile = tasksetDir + "/result/schedulability.txt"
                    try:
                        with open(schedulabilityFile, 'r') as f:
                            m = re.match(r"^\s*(?P<schedulable>\d)\s*$", f.readline())
                            schedulable = int(m.group(1))
                    except:
                        schedulable = 2
                        
                    succeeded = True
                    
                    if schedulable == 0:
                        verboseOutput.write("schedulable\n")
                    else:
                        verboseOutput.write("not schedulable\n")
                                
                    for taskResultFile in sorted(glob.glob(tasksetDir + "/result/task*_result.txt")):
                        taskResultPath = taskResultFile.split("/")
                        verboseOutput.write("\t\t" + taskResultPath[-1] + ": ")
                    
                        with open(taskResultFile, 'r') as f:
                            line = f.readline()
                        m = re.match(r"^\s*(?P<numMissed>\d+)\s+(?P<numPossible>\d+)\s+(?P<numCores>\d+)\s*(?P<maxRuntime>\d+.\d+)?\s*$", line)
                        if m == None: raise Exception("Bad file: " + taskResultFile)
                        numMissed = int(m.group(1))
                        numPossible = int(m.group(2))
                        
                        verboseOutput.write(line)
                        if numMissed > 0 and schedulable == 0: verboseOutput.write(" *****")
                        verboseOutput.write("\n")
                        
                        if numMissed > 0 or numPossible == 0: succeeded = False
                        numTotalPeriods += numPossible
                        numTotalMissedDeadlines += numMissed
                        
                        if schedulable == 0:
                            numSchedulablePeriods += numPossible
                            numSchedulableMissedDeadlines += numMissed
                        elif schedulable == 1:
                            numNotGuaranteedPeriods += numPossible
                            numNotGuaranteedMissedDeadlines += numMissed
                            
                    numTotalTasksets += 1
                    if not succeeded: numTotalFailures += 1
                    
                    if schedulable == 0:
                        numSchedulableTasksets += 1
                        if not succeeded: numSchedulableFailures += 1
                    elif schedulable == 1:
                        numNotGuaranteedTasksets += 1
                        if not succeeded: numNotGuaranteedFailures += 1
                    else:
                        numUnschedulableTasksets += 1
                
                output.write("\tnumTotalTasksets: " + str(numTotalTasksets) + "\n")
                output.write("\tnumTotalFailures: " + str(numTotalFailures) + "\n")
                output.write("\tnumTotalPeriods: " + str(numTotalPeriods) + "\n")
                output.write("\tnumTotalMissedDeadlines: " + str(numTotalMissedDeadlines) + "\n\n")
                
                output.write("\tnumSchedulableTasksets: " + str(numSchedulableTasksets) + "\n")
                output.write("\tnumSchedulableFailures: " + str(numSchedulableFailures) + "\n")
                output.write("\tnumSchedulablePeriods: " + str(numSchedulablePeriods) + "\n")
                output.write("\tnumSchedulableMissedDeadlines: " + str(numSchedulableMissedDeadlines) + "\n\n")
                
                output.write("\tnumNotGuaranteedTasksets: " + str(numNotGuaranteedTasksets) + "\n")
                output.write("\tnumNotGuaranteedFailures: " + str(numNotGuaranteedFailures) + "\n")
                output.write("\tnumNotGuaranteedPeriods: " + str(numNotGuaranteedPeriods) + "\n")
                output.write("\tnumNotGuaranteedMissedDeadlines: " + str(numNotGuaranteedMissedDeadlines) + "\n\n")
                output.write("\tnumUnschedulableTasksets: " + str(numUnschedulableTasksets) + "\n\n")
                                
main()

