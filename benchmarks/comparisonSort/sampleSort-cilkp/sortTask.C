// This code is part of the Problem Based Benchmark Suite (PBBS)
// Copyright (c) 2010 Guy Blelloch and the PBBS team
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
#include "randPerm.h"
#include "parallel.h"
#include "sequenceIO.h"
#include "parseCommandLine.h"

#include "../../../runtime/task.h"

using namespace std;
using namespace benchIO;

struct strCmp {
  bool operator() (char* s1c, char* s2c) {
    char* s1 = s1c, *s2 = s2c;
    while (*s1 && *s1==*s2) {s1++; s2++;};
    return (*s1 < *s2);
  }
};

char* iFile;
char* oFile;
int rounds;
bool permute;
seqData D(NULL, 0, none);
int dt;

template <class T, class CMP>
void timeSort(T* A, intT n, CMP f, int rounds, bool permute, char* outFile) {
  if (permute) randPerm(A, n);
  T* B = new T[n];
  parallel_for (intT i=0; i < n; i++) B[i] = A[i];
  compSort(B, n, f); // run one sort to "warm things up"
  for (int i=0; i < rounds; i++) {
    parallel_for (intT j=0; j < n; j++) B[j] = A[j];
    //startTime();
    compSort(B, n, f);
    //nextTimeN();
  }
  //cout << endl;
  if (outFile != NULL) writeSequenceToFile(B, n, outFile);
  delete B; 
}

int init(int argc, char *argv[])
{
  commandLine P(argc,argv,"[-p] [-o <outFile>] [-r <rounds>] <inFile>");
  iFile = P.getArgument(0);
  oFile = P.getOptionValue("-o");
  rounds = P.getOptionIntValue("-r",1);
  permute = P.getOption("-p");
  D.del();
  D = readSequenceFromFile(iFile);
  dt = D.dt;
  return(0);
}

int run(int argc, char *argv[])
{
  switch (dt) {
  case doubleT:
    timeSort((double*) D.A, D.n, less<double>(), rounds, permute, oFile);
    break;
  case stringT:
    timeSort((char**) D.A, D.n, strCmp(), rounds, permute, oFile); 
    break;
  default:
    cout << "comparisonSort: input file not of right type" << endl;
    return(1);
  }
  return(0);
}

int finalize(int argc, char *argv[])
{
  D.del();
  return(0); // Destroy the universe
}

task_t task = { init, run, finalize };
