# 03_Assembly_README.md
Prep Files for Abyss
-

File input for Abyss wants reads marked with /1 and /2 for R1 and R2 in paired end format. 
The script (fastq_fasta_payl.py) attaches these to the read info.

@info.info -info-info_info

to

@info.info -info-info_info/1




```
for i in $(ls *R1*pe* | sed 's/.fastq//g' );do qsub -v File=$i,Num=1 fastq_fasta.sh;done
for i in $(ls *R2*pe* | sed 's/.fastq//g' );do qsub -v File=$i,Num=2 fastq_fasta.sh;done

for i in $(ls *R* | grep -v AB);do echo $i;done
for i in $(ls *R* | grep -v AB);do rm $i;done

for i in $(ls *R2* | awk -F'_L001' '{print $1}');do mkdir $i;mv $i*AB* $i/;done

DID NOT WORK

for i in $(ls | grep 17);do cat Crop.Abyss.qsub | sed "s/BBTB/$i/g" > $i/$i'.qsub';done
for i in $(ls | grep 17);do cd $i/;qsub $i.qsub;cd ..;done
```

