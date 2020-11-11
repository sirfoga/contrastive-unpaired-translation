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

module load modenv/ml
module load PythonAnaconda/3.7
source .venv/bin/activate
module load PyTorch

DATA_ROOT="./datasets/sahand/sigm"
MODEL_NAME="sigm"

python train.py \
    --dataroot ${DATA_ROOT} \
      --load_size 256 \
        --input_nc 1 \
          --output_nc 1 \
            --name ${MODEL_NAME} \
              --CUT_mode CUT \
                --save_epoch_freq 50
python test.py \
    --dataroot ${DATA_ROOT} \
      --load_size 256 \
        --input_nc 1 \
          --output_nc 1 \
            --name ${MODEL_NAME} \
              --CUT_mode CUT \
                --phase train

exit 0
