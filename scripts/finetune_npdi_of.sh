python tools/train_net.py \
--train_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold1234 \
--test_data=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold0 \
--model_name=r2plus1d --model_depth=34 \
--clip_length_rgb=32 --sampling_rate_rgb=1 \
--clip_length_of=32 --sampling_rate_of=1 \
--batch_size=4 \
--flow_data_type=0 --frame_gap_of=1 --do_flow_aggregation=1 \
--num_channels=2 --input_type=1 \
--gpus=0 --base_learning_rate=0.0001 \
--epoch_size=52000 --num_epochs=8 --step_epoch=2 \
--weight_decay=0.005 --num_labels=2 \
--pretrained_model=/home/murilo/PycharmProjects/R2Plus1D/models/base/r2.5d_d34_l32_ft_sports1m_of.pkl \
--db_type='pickle' --is_checkpoint=0 \
--file_store_path=output/npdi/split1s_of_sports1m



