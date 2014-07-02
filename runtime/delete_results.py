#!/usr/bin/python

import os
import sys
import glob
import re

def main():
    if len(sys.argv) < 2: raise Exception("Too few arguments")
    for experimentDir in sys.argv[1:]:
        for tasksetDir in glob.glob(experimentDir + "/taskset*"):
            #tasksetPath = tasksetDir.split("/")
            #LJ#
            #tmp=re.match(r'taskset(?P<id>\d+)$',tasksetPath[-1])
            #print tasksetPath[-1]
            #if int(tmp.group('id')) < 50:
            #    continue
            for f in glob.glob(tasksetDir + "/result/*"):
                os.remove(f)
main()

