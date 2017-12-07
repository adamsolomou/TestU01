#include "unif01.h"
#include "bbattery.h"
#include "swrite.h"

#include "workload.hpp"

#include <iostream>
#include <random>
#include <chrono>
#include <vector>

#include "tbb/parallel_for.h"


int main (int argc, char *argv[])
{  
   // Turn off all printing to stdout from TestU01
   // You may want to try flipping this to 1 to see what it is actually doing.
   swrite_Basic=0;

   /*********************  Version 1  *********************/
   // for(int i=1; i<2; i++){
   // //while(1){
   //    unif01_Gen *gen=workload_Create();
   //    std::string name=workload_Name(gen);
      
   //    auto results=bbattery_ParallelSmallCrush(gen);
      
   //    for(auto & r : results){
   //      fprintf(stdout, "%s, %d, %s, %d, %.16g\n", name.c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
   //    }
   //    fflush(stdout);
      
   //    workload_Next();
   // }

   /*********************  Version 2  *********************/

   /* Store the RNG instances in a vector */ 
   std::vector< unif01_Gen * > genArray;
   std::vector< std::string > nameArray;

   for(int i=0; i<5; i++){
     genArray.push_back(workload_Create());
     nameArray.push_back( workload_Name(genArray[i]) );
     workload_Next();
   }

   // tbb::parallel_for(int(0), (int)genArray.size(), [&](int j){
   //    auto results=bbattery_SmallCrush(genArray[j]);

   //    for(auto & r : results){
   //      fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[j].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
   //    }
   //    fflush(stdout);
   // }); 

   /*********************  Version 3  *********************/


   /* Call SmallCrush and receive results */ 
   std::vector<bbattery_MultiResults> resultsArray;
   resultsArray = bbattery_MultiParallelSmallCrush(genArray);

   /* Print the results of each RNG to stdout */ 
   for(int j = 0; j < genArray.size(); j++){
      auto results = resultsArray[j].workload_Results; 

   for(auto & r : results){
        fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[j].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
    }
    fflush(stdout);     
   }
                                 
   return 0;
}

