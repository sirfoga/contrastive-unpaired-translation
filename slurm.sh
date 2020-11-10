srun \
    --partition=ml \
    --nodes=1 \
    --tasks=1 \
    --cpus-per-task=2 \
    --gres=gpu:1 \
    --mem-per-cpu=2048 \
    --time=01:30:00 \
    --account=p_ml_cv \
    --pty zsh
module load PythonAnaconda/3.7
source .venv/bin/activate
module load PyTorch
python train.py --dataroot ./datasets/sahand --load_size 256 --input_nc 1 --output_nc 1 --name sahand_CUTGrayscale --CUT_mode CUT
python test.py --dataroot ./datasets/sahand --load_size 256 --input_nc 1 --output_nc 1 --name sahand_CUTGrayscale --CUT_mode CUT --phase train
