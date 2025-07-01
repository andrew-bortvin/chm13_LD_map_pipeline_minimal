# chm13_LD_map_pipeline_minimal

Concise version of the recombination mapping pipeline that can (mostly) be run locally. The one step where this is not feasible is the creation of lookup tables - this step is time consuming even on a cluster.

All inputs necessary to run this pipeline are included in the `inputs` directory, with the exception of the VCF files, which are too large to host here. 

**VCF files subset to 22q11 region and the lookup tables for all populations are provided here: <LINK>**

Pyrho is run from a conda environment, `my-pyrho-env`. The yaml file for this environment can be found in the root directory of this repository. 

Other dependecies: 
* htslib (htslib/1.15.1)
* bedtools (bedtools/2.30.0)
