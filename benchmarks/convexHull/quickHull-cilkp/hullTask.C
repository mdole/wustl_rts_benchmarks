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
#include "gettime.h"
#include "utils.h"
#include "geometry.h"
#include "parallel.h"
#include "geometryIO.h"
#include "parseCommandLine.h"
#include "hull.h"

#include "../../../runtime/task.h"

using namespace std;
using namespace benchIO;

char* iFile;
char* oFile;
int rounds;
_seq<point2d> PIn;

void timeHull(point2d* P, intT n, int rounds, char* outFile) {
  intT m;
  _seq<intT> I;
  for (intT i=0; i < rounds; i++) {
    if (i != 0) I.del();
    //startTime();
    I = hull(P, n);
    //nextTimeN();
  }
  //cout << endl;
  if (outFile != NULL) writeIntArrayToFile(I.A, I.n, outFile);
}

int init(int argc, char *argv[])
{
  commandLine P(argc,argv,"[-o <outFile>] [-r <rounds>] <inFile>");
  iFile = P.getArgument(0);
  oFile = P.getOptionValue("-o");
  rounds = P.getOptionIntValue("-r",1);
  PIn = readPointsFromFile<point2d>(iFile);
  return(0);
}

int run(int argc, char *argv[])
{
  timeHull(PIn.A, PIn.n, rounds, oFile);
  return(0);
}

int finalize(int argc, char *argv[])
{
  PIn.del();
  return(0);  // Destroy the universe
}

task_t task = { init, run, finalize };
