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
# --partition=ml \
# --nodes=1 \
# --tasks=1 \
# --cpus-per-task=1 \
# --gres=gpu:1 \
# --mem-per-cpu=2048 \
# --time=02:00:00 \
# --account=p_ml_cv \
# --pty zsh

module load modenv/ml
module load PythonAnaconda/3.7
source .venv/bin/activate
module load PyTorch

DATA_ROOT="./datasets/sahand"
MODEL_NAME="pat"
IMG_SIZE="286"
NCE_W="1.0"
NCE_LAY="0,4,8"
NET_D="n_layers"
NET_D_LAY="3"

python train.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --CUT_mode CUT \
  --lambda_NCE ${NCE_W} \
  --nce_layers ${NCE_LAY} \
  --netD ${NET_D} \
  --n_layers_D ${NET_D_LAY} \
  --save_epoch_freq 50

python test.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --CUT_mode CUT \
  --lambda_NCE ${NCE_W} \
  --nce_layers ${NCE_LAY} \
  --netD ${NET_D} \
  --n_layers_D ${NET_D_LAY} \
  --phase train

exit 0
