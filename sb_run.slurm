#!/bin/bash
#SBATCH --job-name mlperf
#SBATCH --nodes 1
#SBATCH --exclusive
#SBATCH --output=run.log


hosts=$(srun hostname -i | paste -sd "," -)
echo $hosts

module load openmpi/4.1.4-ucx_1.13.1-cuda_12.0

./benchmark.sh run --workload unet3d \
    --accelerator-type a100 \
    --hosts $hosts \
    --num-accelerators 1 \
    --param dataset.num_files_train=9375 \
    --results-dir resultsdir \
    --param dataset.data_folder=unet3d_data