Example Slurm Runtime
=====================

This directory contains example files and helper scripts for running
FAH on a cluster with Slurm scheduling. (Note the preferential
alternative is having FAH run as a daemon on your cluster's nodes, only
running as hardware slots are otherwise idle).

Because the script name is reported to users via squeue, try naming the
script something informative for both your admins and users, e.g.
`IDLEUSE-fah-partition.sh`. 

In our Slurm scheduled FAH administration, we created an admin only
user, `rcfahuser` to submit these jobs. Jobs were submitted under the 
QOS `idlecycles`, which was set up to be "super preemptable" to all
other QOS. Only `rcfahuser` had access to `idlecycles`.
