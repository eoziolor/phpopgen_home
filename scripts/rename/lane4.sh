#!/bin/bash

#SBATCH -J rename
#SBATCH --array=193-256
#SBATCH -e rename%A-%a.o
#SBATCH -o rename%A-%a.o
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 01:30:00
#SBATCH --mem=8000

my_dir=/group/awhitehegrp/herring_pop/hwftp.novogene.com/C202SC18041736/raw_data
new_dir=/home/eoziolor/phpopg/data/128.120.88.242/raw_data

orig_nam=AWPH04$(echo $SLURM_ARRAY_TASK_ID)
new_nam=AWPH04\_$(echo $SLURM_ARRAY_TASK_ID)

echo $orig_nam
echo $new_nam

mkdir $new_dir/$new_nam

cd $my_dir

for i in $(ls)
	do cd $my_dir/$orig_nam
	ln -s $orig_nam*1.fq.gz $new_dir/$new_nam/$new_nam\_1.fq.gz
	ln -s $orig_nam*2.fq.gz $new_dir/$new_nam/$new_nam\_2.fq.gz
done
