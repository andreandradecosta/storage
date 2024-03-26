#!/bin/bash
#SBATCH --job-name mlperf
#SBATCH --nodes 6
#SBATCH --exclusive
#SBATCH --output=sb_datagen.log

module load openmpi/4.1.4-ucx_1.13.1-cuda_12.0

rm -r unet3d_data/

./benchmark.sh datagen --workload unet3d \
    --accelerator-type a100 \
    --num-parallel 6 \
    --param dataset.num_files_train=18750 \
    --param dataset.data_folder=unet3d_data