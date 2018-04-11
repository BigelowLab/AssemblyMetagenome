## set name of script
#PBS -N BBNORM_SYTO

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 2 week                        
#PBS -l walltime=1:00:00 

## use one compute node and one cpu (this will default to use 2gb of memory)                                                      
#PBS -l select=1:ncpus=22:mem=20GB                                                        
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /home/jgoordial/BBNORM_SYTO                                                         
#PBS -o /home/jgoordial/BBNORM_SYTO
#PBS -m bea                                                         
#PBS -M jgoordial@bigelow.org

module use /mnt/scgc_nfs/opt/modulefiles/common/
module load bbmap
bbnorm.sh in1=/mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/SYTO_FP.fastq in2=/mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/SYTO_RP.fastq out=normalizedSYTOreads#.fastq target=30 min=3 kmer=21

echo start
/bin/sleep 10
echo finished
