# 03_Assembly_README.md
Prep Files for Abyss
-
1.1 Description
-
Creats submittion scripts for abyss assemblies. Optional file manipulation may be required but is dependant on how the read IDs are formatted. Trimmomatic will sort, order and remove unpaired reads.

```
scripts used = Crop.Abyss.qsub
fastq_fasta.sh
fastq_fasta_payl.py
```
-
1.2 CMDS
-
I choose to create a folder structure based on a unique identifier found in the read name. Reads are then moved into their respective folder and a general qsub is modified and saved within the folder.
A for loop may be used to enter the folder submit the qsub and exit. Repeating this process untill all jobs in the list are done.

```
cd $USER/$DIR/

mkdir ASSEMBLY

for i in $(ls *R2* | awk -F'_L001' '{print $1}');do mkdir $PATH/ASSEMBLY/$i;done

for i in $(ls | grep 17);do mv ../fastq/*$i*pe* $PATH/ASSEMBLY/$i/ ;done

for i in $(ls | grep 17);do cd $i/;qsub $i.qsub;cd ..;done

```





OPTIONAL!!!
File input for Abyss wants reads marked with /1 and /2 for R1 and R2 in paired end format. 
The script (fastq_fasta_payl.py) attaches these to the read info. It depends how the read ID 
line is structured in the fastq

@info.info -info-info_info

to

@info.info -info-info_info/1

```
for i in $(ls *R1*pe* | sed 's/.fastq//g' );do qsub -v File=$i,Num=1 fastq_fasta.sh;done
for i in $(ls *R2*pe* | sed 's/.fastq//g' );do qsub -v File=$i,Num=2 fastq_fasta.sh;done

for i in $(ls *R* | grep -v AB);do echo $i;done
for i in $(ls *R* | grep -v AB);do rm $i;done

for i in $(ls *R2* | awk -F'_L001' '{print $1}');do mkdir $i;mv $i*AB* $i/;done

for i in $(ls | grep 17);do cat Crop.Abyss.qsub | sed "s/BBTB/$i/g" > $i/$i'.qsub';done
for i in $(ls | grep 17);do cd $i/;qsub $i.qsub;cd ..;done


```

