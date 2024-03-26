#!/bin/bash
#SBATCH --job-name mlperf
#SBATCH --nodes 1
#SBATCH --exclusive
#SBATCH --output=sb_datasize.log

./benchmark.sh datasize --workload unet3d \
    --accelerator-type a100 \
    --num-accelerators 8 \
    --num-client-hosts 1 \
    --client-host-memory-in-gb 512
