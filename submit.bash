#!/bin/bash
#SBATCH -J Proj07-butanid
#SBATCH -A cs475-575
#SBATCH -p classmpitest
#SBATCH -N 8 # number of nodes
#SBATCH -n 8 # number of tasks
#SBATCH -o mpiproject.out
#SBATCH -e mpiproject.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=butanid@oregonstate.edu

for b in 1 2 4 6 8
    do
        module load openmpi
        mpic++ proj07.cpp -o proj07 -lm
        mpiexec -mca btl self,tcp -np $b ./proj07
    done