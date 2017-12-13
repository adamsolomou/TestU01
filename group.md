HPCE CW6 Group Assessment
=========================

Group name : cysg

Group members (Imperial login) : zkl14, aes414

Use-case   |  Machine (g3.4xlarge or c4.8xlarge)
-----------|------------------------------------
Stress     | c4.8xlarge
Certify    | xxx
Search     | c4.8xlarge

When asked for who is responsible for things, these are
to gently steer marks where appropriate, e.g. for a
particularly good idea. The change in marks is not
great (at most 10% of this component), but is to at
least try to assign some kind of individual weighting.
Most ideas can genuinely be attributed to someone (even
if they are then developed as a grop), and even if
you are pair programming, there is someone who takes
more of a lead.


Identify two (pairs) or three (triples) key improvements you made
=================================================================

Improvement : Using all cores to execute the dominant test, then execute all other tests in parallel
--------------------------------------

Initial idea : zkl14

Feasibility analysis : zkl14

Implementation : zkl14

### What was the big idea?:

To identify the test (DoMultinom) which took the most time, and to use 36 cores chunk the workload n into 36 taskgroups. 

### Why was it expected to improve things?:

The statistical nature of the test allows tasks to work on the same sequence of n. The functions were also thread safe, as long as different arguments are passed to the functions.

### How well did it work?:

Using 36 taskgroups sped up the DoMultinom test significantly, but it was now taking the same time as the other tests. Hence, the remaining tests were done in parallel after the execution of the DoMultinom test. Care was taken to ensure the remaining tasks had same workloads. (see graphs).

Improvement : Executing multiple workloads/RNGs in parallel and parallelising the SmallCrush tests for the search use-case
--------------------------------------

Initial idea : aes414

Feasibility analysis : aes414

Implementation : aes414

### What was the big idea?:

Search-case targets a rate-based metric, so the key idea was to evaluate over multiple different RNGs in parallel and output results progressively. The 10 SmallCrush tests are arranged into 4 groups (~2.3sec/group) which are executed in parallel. This approach then allows to run 9 RNGs in parallel, utilising 36 cores. 

### Why was it expected to improve things?:

Parallelising over RNGs allows to complete multiple RNGs in the same time interval. Then grouping and executing the SmallCrush tests in parallel reduces the time taken to finish each RNG test. There is a trade-off between the two. Executing many slow RNGs in parallel is like stalling a “pipeline”.

### How well did it work?:

Best configuration was having 9 different RNGs in parallel and executing the 10 SmallCrush tests in 4 task_groups. This resulted in executing, on average, 3 RNGs/sec. Configuration results in 3sec gap between printing each mini-batch of RNGs. Having more RNGs in parallel increases this gap which stalls the process significantly.


Identify two (pairs) or three (triples) further changes that should be made
==========================================================================

These can include API changes, restructuring, moving to a
different platform, ...

Further Change : Maximize core usage for other tests
----------------------------------------

Initial idea : zkl14

### What is the big idea?:

The remaining tests aside from the DoMultinom test were grouped into 5 workgroups that took approximately the same time to execute. More parallelism could be achieved using the other 31 cores.

### How difficult would it be, what would the impact be on users?

Simple in concept, but need to ensure that the grainsize is not too small, and that the taskgroups have equal work, which can be laborious in terms of testing.


### How much of an improvment would you expect?

In theory, at most a 50% speed up, since from current results, DoMultinom takes up half the time with 36 cores, and if the other tasks can be executed in zero time, ideally the total execution time can be halved. Howver, a 25% speedup is expected due to overheads.

Further Change : Implement a "proper" pipeline parallelism, potentially implementing it on a GPU
----------------------------------------

Initial idea : aes414

### What is the big idea?:

SmallCrush tests are arranged in groups and executed in parallel as pipeline stages. Multiple pipelines would also be used. Similar as the implemented idea, but now each SmallCrush test in the pipeline operates on a different RNG. Strictly apply lots of RNGs to a test stream.


### How difficult would it be, what would the impact be on users?

Implementation requires restructuring SmallCrush, mainly modifying/restructuring the library itself rather than the driver program. This would be beneficial for external users, as it provides a universal solution since the driver is user defined. GPU implementation requires resolving many data types and various function calls. If attempted, CUDA would be preferred.

### How much of an improvment would you expect?

Analysis for 9 pipelines with 4 stages each: After pipeline fills up (~10sec), 9 RNGs will be outputted every ~2.5sec. CPU implementation does not offer great improvement. Properly implementing a pipeline on a GPU is expected to perform significantly better since pipeline parallelism is well supported in hardware. 

