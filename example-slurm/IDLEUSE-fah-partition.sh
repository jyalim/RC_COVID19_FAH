#!/bin/bash
#SBATCH -p partition
#SBATCH -q idlecycles
#SBATCH -t 0-4
#SBATCH -N 1 
#SBATCH --exclusive
#SBATCH --mem=0
#SBATCH --gres=gpu:8
#SBATCH --comment="PREEMPTABLE FAH COVID19 <partition-name-here>"
## Recommended: put these in directory, e.g. slurm-logs
##              (make sure dir. exists first, otherwise silent fail)
#SBATCH -o fah.%N.%j.out
#SBATCH -e fah.%N.%j.err
##

## 
# This script essentially creates a directory for each compute node
# and runs the FAHClient within that node.  
#
# This keeps work units organized at the NODE level.
##

hname=$(hostname -s)
wd="$hname"
! [[ -d "$wd" ]] && {
  mkdir -p "$wd" 
} || :
cp -v config.xml "$wd"
cd $wd

printf "Running on $hname\n"

module purge
module load fah/7.6.13
FAHClient
