DATA_ROOT="./datasets/sahand"
MODEL_NAME="cut"
IMG_SIZE="286"

python train.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --save_epoch_freq 100 \
  --lambda_GAN 1.0 \
  --lambda_NCE 20.0

python test.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --phase train \
  --lambda_GAN 1.0 \
  --lambda_NCE 20.0
