#!/bin/bash
#SBATCH --job-name mlperf
#SBATCH --nodes 4
#SBATCH --exclusive
#SBATCH --output=datagen.log

module load openmpi/4.1.4-ucx_1.13.1-cuda_12.0
./benchmark.sh datagen --workload unet3d \
    --accelerator-type a100 \
    --num-parallel 4 \
    --param dataset.num_files_train=9375 \
    --param dataset.data_folder=unet3d_data