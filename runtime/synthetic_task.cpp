#include <omp.h>
#include <sstream>
#include <stdio.h>
#include "task.h"
#include "timespec_functions.h"

int run(int argc, char *argv[])
{
    if (argc < 1)
    {
        fprintf(stderr, "ERROR: Two few arguments");
	    return -1;
    }
	    
    int num_segments;
    if (!(std::istringstream(argv[1]) >> num_segments))
    {
        fprintf(stderr, "ERROR: Cannot parse input argument");
        return -1;
    }
    
    
    // For each segment
	for (int i = 0; i < num_segments; ++i)
	{
	    if (argc < 5 + 3*i)
	    {
	        fprintf(stderr, "ERROR: Two few arguments");
		    return -1;
	    }
	    
	    int num_strands;
	    long len_sec, len_ns;
	    if (!(
	        std::istringstream(argv[2 + 3*i]) >> num_strands &&
	        std::istringstream(argv[3 + 3*i]) >> len_sec &&
	        std::istringstream(argv[4 + 3*i]) >> len_ns
	    ))
	    {
	        fprintf(stderr, "ERROR: Cannot parse input argument");
		    return -1;
	    }
	    
		timespec segment_length = { len_sec, len_ns };
		
		// For each strand in parallel
		#pragma omp parallel for schedule(runtime)
		for (int j = 0; j < num_strands; ++j)
		{
		    // Perform work
			busy_work(segment_length);
		}
		
	}
	
	return 0;
}

task_t task = { NULL, run, NULL };

