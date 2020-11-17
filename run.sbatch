#!/bin/bash

#SBATCH --partition=ml
#SBATCH --nodes=1
#SBATCH --tasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=2048
#SBATCH --time=01:30:00
#SBATCH --account=p_ml_cv
#SBATCH --output=%j.out
#SBATCH --error=%j.err

# interactive version:
# srun \
#   --partition=ml \
#   --nodes=1 \
#   --tasks=1 \
#   --cpus-per-task=1 \
#   --gres=gpu:1 \
#   --mem-per-cpu=2048 \
#   --time=01:30:00 \
#   --account=p_ml_cv \
#   --pty zsh

module load modenv/ml
module load PythonAnaconda/3.7
source .venv/bin/activate
module load PyTorch

DATA_ROOT="./datasets/sahand/sigm"
MODEL_NAME="sigm"

python train.py \
  --dataroot ${DATA_ROOT} \
  --load_size 286 \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --CUT_mode CUT \
  --save_epoch_freq 50
  --netD 'n_layers' \
  --n_layers_D 5

# meanwhile do `watch -n10 tail 6436462.out`

python test.py \
  --dataroot ${DATA_ROOT} \
  --load_size 286 \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --CUT_mode CUT \
  --phase train \
  --netD 'n_layers' \
  --n_layers_D 5

exit 0
