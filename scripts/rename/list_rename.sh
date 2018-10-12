#!/bin/bash -l

my_list=/home/eoziolor/phpopg/data/list/pop_samples.tsv

printf "%04d\n" $(cat $my_list | awk '{print $1}') | sed 's/0000/0001/' > zeros_samples_list.txt

