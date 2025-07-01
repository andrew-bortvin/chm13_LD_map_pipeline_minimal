# Scripts

All scripts necessary to reproduce the analysis. Namely:

* `make_table.sh` - Creates lookup table. **Not realistic to run locally - results provided HERE**
* `hyperparam.sh` - Calculate potential optimal hyperparementrs 
* `find_minimizing_params.R` - Find the parameters that minimize Pearson Correlations at 1bp, 10kb and 100kb, along with L2. 
* `bedtooks_mask.sh` - Mask Files using using bedtools 
* `pyrho_optimize.sh` - Create recombination map using pyrho. 