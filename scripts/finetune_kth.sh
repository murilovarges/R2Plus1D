python tools/train_net.py \
--train_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/trainingHough2 \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/validationHough2 \
--model_name=r2plus1d --model_depth=34 \
--clip_length_rgb=32 --batch_size=4 \
--pretrained_model=/home/murilo/PycharmProjects/R2Plus1D/models/base/r2.5d_d34_l32_fs_kinects_rgb.pkl \
--db_type='pickle' --is_checkpoint=0 \
--gpus=0 --base_learning_rate=0.0001 \
--epoch_size=16000 --num_epochs=10 --step_epoch=2 \
--weight_decay=0.005 --num_labels=6 \
--file_store_path=output/kth/finetuning_kinects_hough2