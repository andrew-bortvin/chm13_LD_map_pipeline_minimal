for i in {1..26}
do
	pop_info=$(sed "${i}q;d" ../inputs/make_table_pop_sizes.txt)
	pop=`cut -f1 -d' '<<<${pop_info}`
	n=`cut -f2 -d' '<<<${pop_info}`

	pyrho hyperparam --samplesize ${n} --tablefile ../lookup_tables/${pop}_lookuptable.hdf \
	--mu 1.25e-8 --logfile logs/hyperparam/${pop}_hyperparam.log --ploidy 2 \
	--smcpp_file ../../inputs/smcpp_popsizes_1kg/${pop}_pop_sizes.csv --outfile hyperparam_results/${pop}_hyperparam_results.txt \
	--numthreads 4
done