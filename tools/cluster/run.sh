DATA_ROOT="./datasets/sahand"
MODEL_NAME="cycle_gan"
IMG_SIZE="286"
NCE_W="1.0"
NCE_LAY="0,4,8"
NET_D="n_layers"

python train.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --save_epoch_freq 100

python test.py \
  --dataroot ${DATA_ROOT} \
  --load_size ${IMG_SIZE} \
  --crop_size ${IMG_SIZE} \
  --input_nc 1 \
  --output_nc 1 \
  --name ${MODEL_NAME} \
  --phase train
