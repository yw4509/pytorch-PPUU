#!/bin/bash
#
#SBATCH --job-name=train_MPUR
#SBATCH --output=logs/train_MPUR_%j.out
#SBATCH --error=logs/train_MPUR_%j.err
#SBATCH --time=48:00:00
#SBATCH --gres gpu:1
#SBATCH --constraint="gpu_12gb&pascal"
#SBATCH --exclude="weaver1, weaver2, weaver3, weaver4, weaver5, vine5, vine11"
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --mem=48000
#SBATCH --mail-type=END,FAIL # notifications for job done & fail

eval "$(conda shell.bash hook)"
conda activate PPUU

echo "$@"

cd ../
srun python train_MPUR.py $@
