#!/bin/bash

#SBATCH -J ph_fastqc
#SBATCH --array=193-256
#SBATCH -e ph_fastqc%A-%a.o
#SBATCH -o ph_fastqc%A-%a.o
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 01:30:00
#SBATCH --mem=8000

module load bio3
fastqc --version

#folder
my_dir=/group/awhitehegrp/herring_pop/hwftp.novogene.com/C202SC18041736/raw_data
my_out=/home/eoziolor/phpopg/data/fastqc/
cd $my_dir

num=$(echo $SLURM_ARRAY_TASK_ID)

echo $num

#code
cd $my_dir/AWPH04$num
fastqc *.fq.gz \
-o $my_out

