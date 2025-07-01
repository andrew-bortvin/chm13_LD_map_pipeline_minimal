#!/bin/bash

for i in {1..26}
do
  pop_number=$(( (${i} + 22 - 1) / 22 )) 
  pop_info=$(sed "${pop_number}q;d" ../inputs/make_table_pop_sizes.txt)
  pop=`cut -f1 -d' '<<<${pop_info}`
  chr=22

  window_size=`grep -h L2 ../optimize_paramaters/${pop}_optimize_params.txt | cut -f2 -d' '`
  block_penalty=`grep -h L2 ../optimize_paramaters/${pop}_optimize_params.txt | cut -f1 -d' '`

  pyrho optimize --tablefile ../lookup_tables/${pop}_lookuptable.hdf \
  --windowsize ${window_size} \
  --blockpenalty ${block_penalty} \
  --vcffile ../unrelated_vcf /${pop}_chr22_subset.recode.vcf.gz \
  --outfile opt_params/${pop}_chr${chr}_w${window_size}_b${block_penalty}.rmap \
  --ploidy 2 \
  --numthreads 4 \
  --logfile ../logs/opt_params/${pop}_chr${chr}_w${window_size}_b${block_penalty}.log
done