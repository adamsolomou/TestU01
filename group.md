HPCE CW6 Group Assessment
=========================

Group name : cysg

Group members (Imperial login) : zkl14, aes414

Use-case   |  c4.8xlarge
-----------|------------------------------------
Stress     | zkl14
Certify    | xxx
Search     | aes414

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

Improvement : TBB Taskgroups 
--------------------------------------

Initial idea : zkl14

Feasibility analysis : zkl14

Implementation : zkl14

### What was the big idea?:

To identify the test (DoMultinom) which took the most time, and to use 36 cores chunk the workload n into 36 taskgroups.

### Why was it expected to improve things?:

The statistical nature of the test allows tasks to work on different sequences of n. The functions were also thread safe, as long as different arguments are passed to the functions.

### How well did it work?:

Using 36 taskgroups sped up the DoMultinom test significantly, but it was now taking the same time as the other tests. Hence, the remaining tests were done in parallel after the execution of the DoMultinom test. 

Identify two (pairs) or three (triples) further changes that should be made
==========================================================================

These can include API changes, restructuring, moving to a
different platform, ...

Further Change : GPU
----------------------------------------

Initial idea : zkl14

### What is the big idea?:

To use GPU's to compute the tests in parallel.

### How difficult would it be, what would the impact be on users?

Will be very time-consuming, as there are many functions to be re-written to be run on a GPU, and data transfers have to be done by person who understands the library well.

### How much of an improvment would you expect?

Significant speedups, as the nature of the task lends itself well to GPU computation (workload is fixed at runtime).



