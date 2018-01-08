#!/bin/bash
## set name of script
#PBS -N trimT0

## send the environment variables with job 
#PBS -V
## set the queue
#PBS -q route

## give job X minutes                        
#PBS -l walltime=00:60:00 

## use one compute node and one cpu (this will default to use 2gb of memory)                                                      
#PBS -l select=1:ncpus=4:mem=10GB    
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /home/jgoordial/                                                           
#PBS -o /home/jgoordial/                                                          
#PBS -m bea
#PBS -M jgoordial@bigelow.org

## jobs to submit                                                               
echo start
module use /mnt/scgc_nfs/opt/modulefiles/common/
module load trimmomatic
#Note- cannot write to storage foler bc bigelow has funky permissions, must write to home and copy later, annoying. 
trimmomatic.sh PE /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R1_001.fastq /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R2_001.fastq T0_FP.fastq T0_FUP.fastq T0_RP.fastq T0_RUP.fastq  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

/bin/sleep 10
echo finished
