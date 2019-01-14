#!/usr/bin/env bash
python tools/train_net.py \
--train_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/trainingHough3 \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/validationHough3 \
--model_name=r2plus1d --model_depth=34 \
--clip_length_rgb=32 --batch_size=4 \
--gpus=0 --base_learning_rate=0.01 \
--epoch_size=16000 --num_epochs=35 --step_epoch=10 \
--weight_decay=0.0001 --num_labels=6 \
--file_store_path=output/kth/fromscratch_hough3
#--pretrained_model=/home/murilo/PycharmProjects/R2Plus1D/output/kth/fromscratch_hough3/r2plus1d_20.mdl