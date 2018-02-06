#!/bin/bash -login

#PBS -N copy.sh
#PBS -l mem=16gb 
#PBS -l nodes=1:ppn=1
#PBS -l walltime=2:00:00 -j oe
#PBS -A mitchmcg

cd $PBS_O_WORKDIR

cp ${File} .
