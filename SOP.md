# Trim + Assembly with Spades: bigelow specific :octocat:
## Jackie Goo, Jauary 2018 

Q control and Assembly of metagenomic reads for Atlantis Massif seq

Commands included here, example PBS also available in directory separately. 

## First lets trim our seqs for quality 
note includes bigelow server specific commands! 

Tool Reference:  http://www.usadellab.org/cms/?page=trimmomatic

```module use /mnt/scgc_nfs/opt/modulefiles/common/ ```
```module load trimmomatic```

Note- cannot write to storage foler bc bigelow has funky permissions, must write to home dir and copy later, hella annoying. 

```trimmomatic.sh PE /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R1_001.fastq /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R2_001.fastq T0_FP.fastq T0_FUP.fastq T0_RP.fastq T0_RUP.fastq  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 ```

should check out the results here and make sure they make sense. 


## Next, Assemble via SPAdes
Tool Reference: http://cab.spbu.ru/software/spades/


```module use /mnt/scgc_nfs/opt/modulefiles/common/ ```
```module load spades```

remember output needs to be home dir at Bigelow.
default memory for SPAdes is 250GB, need to manually flag alternative if need more (regardless of PBS mem alloc). 

```spades.py --memory 400 --meta --pe1-1 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/T0_FP.fastq --pe1-2 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/T0_RP.fastq -o /home/jgoordial/T0_spades_wall```

IF it stops for some reason ( like you forgot the memory thing above and need more) you dont need to start again, can use the --continue flag as below to keep going 

```pades.py --memory 400 --meta --pe1-1 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/T0_FP.fastq --pe1-2 /mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Trimmomatic_out/T0_RP.fastq --continue -o /home/jgoordial/T0_spades_wall```

## Lets map those reads back to our assembly


I'm using BBMAP and SAMTOOLS
Tool Reference: https://sourceforge.net/projects/bbmap/
and: https://github.com/davetang/learning_bam_file


```module use /mnt/scgc_nfs/opt/modulefiles/common/```
```module load anaconda3```
```module load bbmap```

this will generate an index and map in one command 

```bbmap.sh in1=/mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R1_001.fastq in2=/mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/T0_R2_001.fastq ref=/mnt/storage/orcutt/Jackie_bioinformatics/AM_metageome/Goordial_DCO/Spades_out_T0/contigs.fasta out=mapped.sam covstats=constats.txt basecov=basecov.txt bincov=bincov.txt```

As a fun note - if the headers in your contigs have weird things like spaces or "+"s other programs like Anvi'o will not be a huge fan. Can save yourself re-doing this step again later by making sure your headers are cool, and then mapping. 

## Convert SAM files to BAM

I'm using SamTools
Tool Reference: https://davetang.org/wiki/tiki-index.php?page=SAMTools

obvie point things to where they need to go and where they are. 

```module use /mnt/scgc_nfs/opt/modulefiles/common/```
```module load samtools```

```samtools view -bS mapped.sam > mapped.bam```

now sort your bam file ( always a good idea amiright) 

```samtools sort mapped.bam -o mapped.bam``` 




Voila. 


