#include "unif01.h"
#include "bbattery.h"
#include "swrite.h"

#include "workload.hpp"

#include <iostream>
#include <random>
#include <chrono>

#include "tbb/parallel_for.h"

#define PARALLEL_RNGs 18

int main (int argc, char *argv[])
{  
   // Turn off all printing to stdout from TestU01s
   // You may want to try flipping this to 1 to see what it is actually doing.
   swrite_Basic=0;

   // unif01_Gen * genArray[PARALLEL_RNGs];
   // std::string nameArray[PARALLEL_RNGs];
   
   // //Loop forever - the user will kill the process
   // //while(1){
   //    /* Store the RNG instances in a vector */ 
   //    for(int i=0; i<PARALLEL_RNGs; i++){
   //       genArray[i] = workload_Create();
   //       nameArray[i] = workload_Name(genArray[i]);
   //       workload_Next();
   //    }
      
   //    /* Test the RNGs in parallel */ 
   //    tbb::parallel_for(0u, (unsigned)PARALLEL_RNGs, [&](unsigned i){
   //       std::vector<bbattery_Result> results;
   //       results=bbattery_SmallCrush(genArray[i]);
         
   //       for(auto & r : results){
   //         fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[i].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
   //       }
   //       fflush(stdout);
   //    });   
   // //}

   //Loop forever - the user will kill the process
   //while(1){
   for(int i=0; i<PARALLEL_RNGs; i++){
      unif01_Gen *gen=workload_Create();
      std::string name=workload_Name(gen);

      std::vector<bbattery_Result> results;
      results=bbattery_ParallelSmallCrush(gen);

      for(auto & r : results){
        fprintf(stdout, "%s, %d, %s, %d, %.16g\n", name.c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
      }
      fflush(stdout);

      workload_Next();
   }
   //}
   return 0;
}
