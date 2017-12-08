#include "unif01.h"
#include "bbattery.h"
#include "swrite.h"

#include "workload.hpp"

#include <iostream>
#include <random>
#include <chrono>
#include <vector>

#include "tbb/parallel_for.h"
#include "tbb/task_group.h"

#define PAR_RNGs 5


int main (int argc, char *argv[])
{  
   // Turn off all printing to stdout from TestU01
   // You may want to try flipping this to 1 to see what it is actually doing.
   swrite_Basic=0;

   /*********************  Version 1  *********************/
   // for(int i=0; i<5; i++){
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

   unif01_Gen * genArray[PAR_RNGs];
   std::string nameArray[PAR_RNGs];

   //while(1){
      /* Create and store PAR_RNGs in an array */ 
      for(int i=0; i<PAR_RNGs; i++){
         genArray[i] = workload_Create();
         nameArray[i] = workload_Name(genArray[i]);
         workload_Next();;
        // genArray.push_back(workload_Create());
        // nameArray.push_back( workload_Name(genArray[i]) );
        // workload_Next();
      }

      tbb::task_group group; 

      group.run( [&]()
      {        
         auto results=bbattery_SmallCrush(genArray[1]);

         for(auto & r : results){
           fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[1].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
         }
         fflush(stdout);
 
      }
      );
      group.run( [&]()
      {
      
         auto results=bbattery_SmallCrush(genArray[0]);

         for(auto & r : results){
           fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[0].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
         }
         fflush(stdout);
        
      }
      );
      group.run( [&]()
      {
         
         auto results=bbattery_SmallCrush(genArray[2]);

         for(auto & r : results){
           fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[2].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
         }
         fflush(stdout);
     
      }
      );
      group.run( [&]()
      {
        
         auto results=bbattery_SmallCrush(genArray[3]);

         for(auto & r : results){
           fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[3].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
         }
         fflush(stdout);
     
      }
      );
      group.run( [&]()
      {
      
         auto results=bbattery_SmallCrush(genArray[4]);

         for(auto & r : results){
           fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[4].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
         }
         fflush(stdout);
      
      }
      );

      group.wait(); 


      // tbb::parallel_for(0u, (unsigned)PAR_RNGs, [&](unsigned j){
      //    auto results=bbattery_SmallCrush(genArray[j]);

      //    for(auto & r : results){
      //      fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[j].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
      //    }
      //    fflush(stdout);
      // }); 
   //}

   /*********************  Version 3  *********************/

   // std::vector< unif01_Gen * > genArray;
   // std::vector< std::string > nameArray;

   /* Call SmallCrush and receive results */ 
   // std::vector<bbattery_MultiResults> resultsArray;
   // resultsArray = bbattery_MultiParallelSmallCrush(genArray);

   // /* Print the results of each RNG to stdout */ 
   // for(int j = 0; j < genArray.size(); j++){
   //    auto results = resultsArray[j].workload_Results; 

   // for(auto & r : results){
   //      fprintf(stdout, "%s, %d, %s, %d, %.16g\n", nameArray[j].c_str(), r.TestIndex, r.TestName.c_str(), r.SubIndex, r.pVal);
   //  }
   //  fflush(stdout);     
   // }
                                 
   return 0;
}

