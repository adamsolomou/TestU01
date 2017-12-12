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

Improvement : <some descriptive name>
--------------------------------------

Initial idea : zkl14

Feasibility analysis : zkl14

Implementation : zkl14

### What was the big idea?:

(at most 50 words)

### Why was it expected to improve things?:

(at most 50 words)

### How well did it work?:

(at most 50 words)

Improvement : Parallelising over multiple workloads/RNGs for the search use-case
--------------------------------------

Initial idea : aes414

Feasibility analysis : aes414

Implementation : aes414

### What was the big idea?:

Refernce driver evaluates a single RNG instance at a time. The use-case targets a rate-based metric, so the key idea was to evaluate over multiple different RNGs at the same time. On a 36-core machine, we could have up to 36 RNGs running in parallel. Each RNG takes ~9.2sec to execute sequentially. So this approach would result in 36 RNGs being evaluated in ~10sec.

### Why was it expected to improve things?:

(at most 50 words)

### How well did it work?:

(at most 50 words)


Identify two (pairs) or three (triples) further changes that should be made
==========================================================================

These can include API changes, restructuring, moving to a
different platform, ...

Further Change : <some descriptive name>
----------------------------------------

Initial idea : (Imperial login)

### What is the big idea?:

(at most 50 words)

### How difficult would it be, what would the impact be on users?

(at most 50 words)

### How much of an improvment would you expect?

(at most 50 words)

Further Change : <some descriptive name>
----------------------------------------

Initial idea : (Imperial login)

### What is the big idea?:

(at most 50 words)

### How difficult would it be, what would the impact be on users?

(at most 50 words)

### How much of an improvment would you expect?

(at most 50 words)

