#!/bin/bash

#SBATCH -J check_md5
#SBATCH -e check_md5-%j.o
#SBATCH -o check_md5-%J.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -t 03:00:00
#SBATCH --mem=60000

my_dir=/home/eoziolor/phpopg/data/128.120.88.242/raw_data/
cd $my_dir
touch check_md5

for folder in $(ls)
	do cd $folder
	cat MD5.txt | md5sum -c - >> ../check_md5
	cd ..
done
