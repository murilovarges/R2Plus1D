#!/usr/bin/env bash
python tools/train_net.py \
--train_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold1234 \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold0 \
--model_name=r2plus1d --model_depth=34 \
--clip_length_rgb=32 --batch_size=4 \
--gpus=0 --base_learning_rate=0.01 \
--epoch_size=52000 --num_epochs=10 --step_epoch=10 \
--weight_decay=0.0001 --num_labels=2 \
--file_store_path=output/npdi/split1s_rgb_train
