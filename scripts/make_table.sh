pop_info=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ../inputsmake_table_pop_sizes.txt)
pop=`cut -f1 -d' '<<<${pop_info}`
n=`cut -f2 -d' '<<<${pop_info}`
N=`cut -f3 -d' '<<<${pop_info}`

pyrho make_table -n ${n} -N ${N} --mu 1.25e-8 --logfile ../logs/make_table/${pop}_make_table.log --outfile ../lookup_tables/${pop}_lookuptable.hdf \
	--approx --smcpp_file ../inputs/smcpp_popsizes_1kg/${pop}_pop_sizes.csv --decimate_rel_tol 0.1 --numthreads 48