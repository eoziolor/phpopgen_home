#!/bin/bash

#SBATCH -J ph_fastqc
#SBATCH -e ph_fastqc-%j.o
#SBATCH -o ph_fastqc-%J.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -t 03:00:00
#SBATCH --mem=60000

module load fastqc

#folder
my_dir=/home/eoziolor/phpopg/data/raw_fastq

#code
fastqc $my_dir/reads/AWPH* \
-o $my_dir/fastqc/

