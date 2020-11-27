module --force purge
module load modenv/ml
module load Python/3.7.4
source .venv/bin/activate
module load PyTorch
module load Pillow

echo "using $(which python)"  # just to check 
