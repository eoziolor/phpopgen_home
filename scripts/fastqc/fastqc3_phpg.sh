#!/bin/bash

#SBATCH -J ph_fastqc
#SBATCH --array=113-121
#SBATCH -e ph_fastqc%A-%a.o
#SBATCH -o ph_fastqc%A-%a.o
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 01:30:00
#SBATCH --mem=8000

module load bio3
fastqc --version

#folder
my_dir=/home/eoziolor/phpopg/data/128.120.88.242/raw_data
my_out=/home/eoziolor/phpopg/data/fastqc/
cd $my_dir

if (($SLURM_ARRAY_TASK_ID < 10))
then
	num=00$(echo $SLURM_ARRAY_TASK_ID)
elif (($SLURM_ARRAY_TASK_ID < 100))
then
	num=0$(echo $SLURM_ARRAY_TASK_ID)
else
	num=$(echo $SLURM_ARRAY_TASK_ID)
fi

echo $num

#code
cd $my_dir/AWPH*$num
fastqc *.fq.gz \
-o $my_out

