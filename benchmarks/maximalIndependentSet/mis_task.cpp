// This code is part of the Problem Based Benchmark Suite (PBBS)
// Copyright (c) 2011 Guy Blelloch and the PBBS team
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights (to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#include <iostream>
#include <algorithm>
#include "task.h"
#include "maximalIndependentSet/ndMIS/gettime.h"
#include "maximalIndependentSet/ndMIS/utils.h"
#include "maximalIndependentSet/ndMIS/graph.h"
#include "maximalIndependentSet/ndMIS/parallel.h"
#include "maximalIndependentSet/ndMIS/IO.h"
#include "maximalIndependentSet/ndMIS/graphIO.h"
#include "maximalIndependentSet/ndMIS/parseCommandLine.h"
#include "maximalIndependentSet/ndMIS/MIS.h"
using namespace std;
using namespace benchIO;

void timeMIS(graph<intT> G, int rounds, char* outFile) {
  graph<intT> H = G.copy(); //because MIS might modify graph
  char* flags = maximalIndependentSet(H);
  for (int i=0; i < rounds; i++) {
    free(flags);
    H.del();
    H = G.copy();
    startTime();
    flags = maximalIndependentSet(H);
    nextTimeN();
  }
  cout << endl;

  if (outFile != NULL) {
    int* F = newA(int, G.n);
    for (int i=0; i < G.n; i++) F[i] = flags[i];
    writeIntArrayToFile(F, G.n, outFile);
    free(F);
  }

  free(flags);
  G.del();
  H.del();
}

char* iFile;
char* oFile;
int rounds;
graph<intT> *G;

int init(int argc, char **argv) {
	commandLine P(argc, argv, "[-o <outFile>] [-r <rounds>] <inFile>");
	iFile = P.getArgument(0);
	oFile = P.getOptionValue("-o");
	rounds = P.getOptionIntValue("-r",1);
	graph<intT> G2 = readGraphFromFile<intT>(iFile);
	G = &G2;
    std::cout << version_string << std::endl;
	return 0;
} //init

int run(int argc, char **argv) {
	timeMIS(*G, rounds, oFile);
	return 0;
} //run

int finalize(int argc, char **argv) {

	return 0;
} //finalize

task_t task = { init, run, finalize };
