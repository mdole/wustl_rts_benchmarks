#include "task.h"
#include "removeDuplicates/deterministicHash/gettime.h"
#include "removeDuplicates/deterministicHash/parallel.h"
#include "removeDuplicates/deterministicHash/sequenceIO.h"
#include "removeDuplicates/deterministicHash/parseCommandLine.h"
#include "removeDuplicates/deterministicHash/sequence.h"
#include "removeDuplicates/deterministicHash/deterministicHash.h"
#include <algorithm>
using namespace std;
using namespace benchIO;

template <class T>
_seq<T> timeRemDups(T* A, intT n, int rounds) {
  T* B = new T[n];
  parallel_for (intT i=0; i < n; i++) B[i] = A[i];
  _seq<T> R = removeDuplicates(_seq<T>(B, n)); //run one to "warm things up"
  for (int j=0; j < rounds; j++) {
    R.del();
    parallel_for (intT i=0; i < n; i++) B[i] = A[i];
    startTime();
    R = removeDuplicates(_seq<T>(A, n));
    nextTimeN();
  } //for
  cout << endl;
  delete B;
  return R;
}//template

  char *oFile;
  char *iFile;
  int rounds;
  intT dt;
  seqData D(NULL, 0, none);

int init(int argc, char **argv) {

commandLine P(argc, argv,"[+o <outfile>] [+r <rounds>] <infile>");
iFile = P.getArgument(0);
oFile = P.getOptionValue("+o");
rounds = P.getOptionIntValue("+r",1);
std::cout << version_string << std::endl;
	
	return 0;

} //init

int run(int argc, char **argv) {

  D = readSequenceFromFile(iFile);
  dt = D.dt;
  switch (dt) {
  case intType: {
    intT* A = (intT*) D.A;
    _seq<intT> R = timeRemDups(A, D.n, rounds);
    if (oFile != NULL) writeSequenceToFile(R.A, R.n, oFile);
    delete A;}
    break;

  case stringT: {
    char** A = (char**) D.A;
    _seq<char*> R = timeRemDups(A, D.n, rounds);
    if (oFile != NULL) writeSequenceToFile(R.A, R.n, oFile);}
    break;

  case stringIntPairT: {
    stringIntPair* AA = (stringIntPair*) D.A;
    stringIntPair** A = new stringIntPair*[D.n];
    parallel_for (intT i=0; i < D.n; i++) A[i] = AA+i;
    _seq<stringIntPair*> R = timeRemDups(A, D.n, rounds);
    delete A;
    // need to fix delete on AA
    if (oFile != NULL) {
      stringIntPair* B = new stringIntPair[R.n];
      parallel_for (intT i=0; i < R.n; i++) B[i] = *R.A[i];
      writeSequenceToFile(B, R.n, oFile);
      delete B;
    }}
    break;

  default:
    cout << "removeDuplicates: input file not of right type" << endl;
	return (1);
  }
return 0;
} //run

int finalize(int argc, char **argv) {

	return 0;
} //finalize

task_t task = { init, run, finalize };
