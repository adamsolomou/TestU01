[1mdiff --git a/testu01/testu01/bbattery.cpp b/testu01/testu01/bbattery.cpp[m
[1mindex 35d7e2c..5560cea 100644[m
[1m--- a/testu01/testu01/bbattery.cpp[m
[1m+++ b/testu01/testu01/bbattery.cpp[m
[36m@@ -3253,11 +3253,11 @@[m [mstatic void DoMultinom (lebool fileFlag, /* */[m
    /* Limit sample size n to NLIM because of memory limitations. */[m
    /* Determine number of replications N from this. */[m
   [m
[31m-   nb = nb/tasks;[m
[32m+[m[32m  // nb = nb/tasks;[m
 [m
 [m
[31m-   N = 1 + nb / NLIM;[m
[31m-   n = nb / N;[m
[32m+[m[32m   N = 1 + (nb/tasks) / NLIM;[m
[32m+[m[32m   n = (nb/tasks) / N;[m
    /* Time limit on test: N = 30 */[m
    N = util_Min (30, N);[m
    /* Set n as a multiple of s = 32 */[m
[36m@@ -4071,30 +4071,30 @@[m [mstatic void Rabbit (unif01_Gen * gen, char *fname, double nb, int Rep[], TestGlo[m
    printf("value of j %d\n",j);[m
    printf("value of j2 %d\n",j2);[m
   };[m
[31m-[m
[31m-  // rabbitTest1(workload_Clone(gen));[m
[31m-  // rabbitTest2(workload_Clone(gen));[m
[31m-  // rabbitTest3(workload_Clone(gen));[m
[31m-  // rabbitTest4(workload_Clone(gen));[m
[31m-  // rabbitTest5(workload_Clone(gen));[m
[31m-[m
[32m+[m[32m/*[m
[32m+[m[32m   rabbitTest1(workload_Clone(gen));[m
[32m+[m[32m   rabbitTest2(workload_Clone(gen));[m
[32m+[m[32m   rabbitTest3(workload_Clone(gen));[m
[32m+[m[32m   rabbitTest4(workload_Clone(gen));[m
[32m+[m[32m   rabbitTest5(workload_Clone(gen));[m
[32m+[m[32m*/[m
 [m
 [m
 [m
[31m-//   tbb::task_group othertests;[m
[31m-//   othertests.run([&](){  rabbitTest1(workload_Clone(gen)); });[m
[31m-// othertests.run([&](){  rabbitTest2(workload_Clone(gen)); });[m
[31m-// othertests.run([&](){  rabbitTest3(workload_Clone(gen)); });[m
[31m-// othertests.run([&](){  rabbitTest4(workload_Clone(gen)); });[m
[31m-// othertests.run([&](){  rabbitTest5(workload_Clone(gen)); });[m
[31m-// othertests.wait();[m
[32m+[m[32m   tbb::task_group othertests;[m
[32m+[m[32m   othertests.run([&](){  rabbitTest1(workload_Clone(gen)); });[m
[32m+[m[32m othertests.run([&](){  rabbitTest2(workload_Clone(gen)); });[m
[32m+[m[32m othertests.run([&](){  rabbitTest3(workload_Clone(gen)); });[m
[32m+[m[32m othertests.run([&](){  rabbitTest4(workload_Clone(gen)); });[m
[32m+[m[32m othertests.run([&](){  rabbitTest5(workload_Clone(gen)); });[m
[32m+[m[32m othertests.wait();[m
   // rabbitTest1(workload_Clone(gen));[m
   // rabbitTest2(workload_Clone(gen));[m
   // rabbitTest3(workload_Clone(gen));[m
   // rabbitTest4(workload_Clone(gen));[m
   // rabbitTest5(workload_Clone(gen));[m
 [m
[31m-[m
[32m+[m[32m/*[m
    {[m
       const long NLIM = 4000000;[m
       snpair_Res *res;[m
[36m@@ -4559,7 +4559,7 @@[m [mstatic void Rabbit (unif01_Gen * gen, char *fname, double nb, int Rep[], TestGlo[m
 [m
    DoWalk (fileFlag, gen, nb, &j, j2, Rep, globals);[m
 [m
[31m-[m
[32m+[m[32m*/[m
 [m
 [m
 [m
