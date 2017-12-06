#include "unif01.h"
#include "bbattery.h"
#include "swrite.h"

#include "workload.hpp"

#include <iostream>
#include <random>
#include <chrono>
#include <vector>

int main (int argc, char *argv[])
{  
   // Turn off all printing to stdout from TestU01
   // You may want to try flipping this to 1 to see what it is actually doing.
   swrite_Basic=1;

   /* Create 5 workloads */
   unif01_Gen *gen_1=workload_Create(); 
   std::string name_1=workload_Name(gen_1);

   workload_Next();

   unif01_Gen *gen_2=workload_Create(); 
   std::string name_2=workload_Name(gen_2);

   workload_Next();

   unif01_Gen *gen_3=workload_Create(); 
   std::string name_3=workload_Name(gen_3);

   workload_Next();

   unif01_Gen *gen_4=workload_Create(); 
   std::string name_4=workload_Name(gen_4);

   workload_Next();

   unif01_Gen *gen_5=workload_Create(); 
   std::string name_5=workload_Name(gen_5);

   /* Store the RNG instances in a vector */ 
   std::vector< unif01_Gen * > genArray;
   std::vector< std::string > nameArray;

   //MIGHT WANT TO CHANGE THIS -> DON'T USE PUSH BACK 
   genArray.push_back(gen_1);
   genArray.push_back(gen_2);
   genArray.push_back(gen_3);
   genArray.push_back(gen_4);
   genArray.push_back(gen_5);

   nameArray.push_back(name_1);
   nameArray.push_back(name_2);
   nameArray.push_back(name_3);
   nameArray.push_back(name_4);
   nameArray.push_back(name_5);

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



