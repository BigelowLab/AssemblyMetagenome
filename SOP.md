# Trim + Assembly with Spades: bigelow specific code :octocat:
## Jackie Goo, Jauary 2018 

Q control and Assembly of metagenomic reads for Atlantis Massif seq

# First lets trim our seqs for quality 
#note includes bigelow server specific commands! 

```module use /mnt/scgc_nfs/opt/modulefiles/common/```
```module load trimmomatic```

#Note- cannot write to storage foler bc bigelow has funky permissions, must write to home dir and copy later, hella annoying. 

```trimmomatic.sh PE /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R1_001.fastq /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R2_001.fastq T0_FP.fastq T0_FUP.fastq T0_RP.fastq T0_RUP.fastq  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 ```
