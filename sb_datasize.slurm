#!/bin/bash
#SBATCH --job-name mlperf
#SBATCH --nodes 1
#SBATCH --exclusive
#SBATCH --output=datasize.log

module load openmpi/4.1.4-ucx_1.13.1-cuda_12.0
./benchmark.sh datasize --workload unet3d \
    --accelerator-type a100 \
    --num-accelerators 1 \
    --num-client-hosts 1 \
    --client-host-memory-in-gb 256
