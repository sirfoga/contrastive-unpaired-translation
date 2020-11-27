module --force purge
module load modenv/ml
conda deactivate
module load Python/3.7
source .venv/bin/activate
module load PyTorch
module load Pillow

echo "using $(which python)"  # just to check 
