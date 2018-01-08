## set name of script
#PBS -N boncat_Sp_wall_con

## send the environment variables with job 
#PBS -V

## set the queue                                                                          
#PBS -q route                                                                   

## give job 160 minutes                        
#PBS -l walltime=160:00:00 

## use one compute node and one cpu (this will default to use 2gb of memory)                                                      
#PBS -l select=1:ncpus=2:mem=1000GB                                                        
                                                              
## output files placed in output directory in the user vcc’s home directory                                     
#PBS -e /home/jgoordial/BONCAT_Spades_wall                                                           
#PBS -o /home/jgoordial/BONCAT_Spades_wal 
#PBS -m bea                                                         
#PBS -M jgoordial@bigelow.org

module use /mnt/scgc_nfs/opt/modulefiles/common/
module load spades
/mnt/scgc_nfs/opt/common/spades/3.9.0/bin/spades.py --memory 400 --meta --pe1-1 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/BONCAT_FP.fastq --pe1-2 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/BONCAT_RP.fastq --continue -o /home/jgoordial/BONCAT_spades_wall
echo start
/bin/sleep 10
echo finished
