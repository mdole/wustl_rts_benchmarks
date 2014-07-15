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
#include "geometryIO.h"
#include "parseCommandLine.h"
#include "parallel.h"
#include "nbody.h"

#include "../../../runtime/task.h"

using namespace std;
using namespace benchIO;

char* iFile;
char* oFile;
int rounds;
_seq<point3d> PIn;

// *************************************************************
//  TIMING
// *************************************************************

void timeNBody(point3d* pts, intT n, int rounds, char* outFile) {
  particle** p = newA(particle*,n);
  particle* pp = newA(particle, n);
  {parallel_for (intT i=0; i < n; i++) 
      p[i] = new (&pp[i]) particle(pts[i],1.0);}
  for (int i=0; i < rounds; i++) {
    //startTime();
    nbody(p, n);
    //nextTimeN();
  }
  //cout << endl;

  point3d* O = newA(point3d,n);
  parallel_for(intT i=0; i < n; i++) 
    O[i] = point3d(0.,0.,0.) + p[i]->force;

  if (outFile != NULL) 
    writePointsToFile(O,n,outFile);

  free(O);
  free(p);
  free(pp);
}

int init(int argc, char *argv[])
{
  commandLine P(argc,argv,"[-o <outFile>] [-r <rounds>] <inFile>");
  iFile = P.getArgument(0);
  oFile = P.getOptionValue("-o");
  rounds = P.getOptionIntValue("-r",1);
  PIn = readPointsFromFile<point3d>(iFile);
  return(0);
}

int run(int argc, char *argv[])
{
  timeNBody(PIn.A, PIn.n, rounds, oFile);
  return(0);
}

int finalize(int argc, char *argv[])
{
  PIn.del();
  return(0);  // Destroy the universe
}

task_t task = { init, run, finalize };
