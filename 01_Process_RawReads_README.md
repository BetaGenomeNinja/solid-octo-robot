# 01_Process_RawReads_README.md
-
1 - COPY FILES
-

1.1 Description - Make new directory and COPY files to your /mnt/scratch/${USER}/${DIR}

${USER} == your scratch space

${DIR} == A folder where all results for this experiment will be stored

```javascript
scripts used = copy.sh
```

1.2 CMDS

```javascript

cd /mnt/scratch/${USER}

mkdir /mnt/scratch/${USER}/${DIR}

cd /mnt/research/beet/raw_reads/genomes/admera/Paul_Scripts/

cp copy.sh /mnt/scratch/${USER}/${DIR}/	

cd /mnt/scratch/${USER}/${DIR}/

```

Comments:

In the next lines of bash code, the first for loop allows you to see the data you capture before you submit a the qsub using the variable list!!! 

qdel all

This cmd will delete all of your jobs from the queue, when not if, you screw up... 

for loops = capture data in list $(cat,ls,awk,ect...)
grep -v = do not print lines that match pattern. I used (grep -v trim) becasue there were files I did not want, I filtered with grep. 
echo = print lines
qsub -v = submit variable to qsub File= $i = ${File} in copy.sh


```
for i in $(ls /mnt/research/beet/raw_reads/genomes/admera/*.gz | grep -v trim);do echo $i;done

for i in $(ls /mnt/research/beet/raw_reads/genomes/admera/*.gz | grep -v trim);do qsub -v File=$i copy.sh;done
```


-
2 - Trimmomatic
-
2.1 Description - Program to process fastq for Quality,Adapters,Paired and Unpaired

Bolger, A. M., Lohse, M., & Usadel, B. (2014). Trimmomatic: A flexible trimmer for Illumina Sequence Data. Bioinformatics, btu170.

http://www.usadellab.org/cms/?page=trimmomatic

```
scripts used = trim.LARGE.qsub

```

2.2 CMDS

```
cd /mnt/scratch/galewski/CROP/CT_EL_SR_PAT_genomes

for i in $(ls *.gz);do echo $i;done

for i in $(ls *.gz | awk -F'_R' '{print $1}');do echo $i;done | uniq

for i in $(ls *.gz | awk -F'_R' '{print $1}');do echo $i;done | uniq > tmp; for i in $(cat tmp);do echo $i;done

for i in $(ls *.gz | awk -F'_R' '{print $1}');do echo $i;done | uniq > tmp; for i in $(cat tmp);do qsub -v File=$i trim.LARGE.qsub;done;rm tmp

for i in $(ls *se* | awk -F'_R' '{print $1}');do echo $i;done | uniq > tmp; for i in $(cat tmp);do cat $i'_R1_se.fastq' $i'_R2_se.fastq' > $i'_se.fastq'; done

```




