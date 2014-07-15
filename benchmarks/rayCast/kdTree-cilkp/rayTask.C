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
#include "ray.h"

#include "../../../runtime/task.h"

using namespace std;
using namespace benchIO;

char* triFile;
char* rayFile;
char* oFile;
int rounds;
triangles<pointT> T(0, 0, NULL, NULL);
intT n;
ray<pointT>* rays;

void timeRayCast(triangles<pointT> T, ray<pointT>* rays, intT nRays, 
	    int rounds, char* outFile) {
  // run one as warmup
  intT* m = rayCast(T, rays, nRays);
  for (int i=0; i < rounds; i++) {
    if (m != NULL) free(m);
    //startTime();
    m = rayCast(T, rays, nRays);
    //nextTimeN();
  }
  //cout << endl;
  if (outFile != NULL) writeIntArrayToFile(m, nRays, outFile);
  free(m);
}

int init(int argc, char *argv[])
{
  commandLine P(argc,argv,"[-o <outFile>] [-r <rounds>] <triangleFile> <rayFile>");
  pair<char*,char*> fnames = P.IOFileNames();
  triFile = fnames.first;
  rayFile = fnames.second;
  oFile = P.getOptionValue("-o");
  rounds = P.getOptionIntValue("-r",1);
  T = readTrianglesFromFile<pointT>(triFile,1);
  _seq<pointT> Pts = readPointsFromFile<pointT>(rayFile);
  n = Pts.n/2;
  rays = newA(ray<pointT>, n);
  parallel_for (intT i=0; i < n; i++) {
    rays[i].o = Pts.A[2*i];
    rays[i].d = Pts.A[2*i+1]-pointT(0,0,0);
  }
  return(0);
}

int run(int argc, char *argv[])
{
  timeRayCast(T, rays, n, rounds, oFile);
  return(0);
}

int finalize(int argc, char *argv[])
{
  T.del();
  free(rays);
  return(0);  // Destroy the universe
}

task_t task = { init, run, finalize };
