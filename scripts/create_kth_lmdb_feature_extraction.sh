python data/create_video_db.py \
--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/testHough3_id_dense_l32_stride1.txt \
--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/testHough3_dense_stride1 \
--use_list=1 --use_video_id=1 --use_start_frame=1

python data/create_video_db.py \
--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/trainingHough3_id_dense_l32_stride1.txt \
--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/trainingHough3_dense_stride1 \
--use_list=1 --use_video_id=1 --use_start_frame=1


python data/create_video_db.py \
--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/validationHough3_id_dense_l32_stride1.txt \
--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/kth/validationHough3_dense_stride1 \
--use_list=1 --use_video_id=1 --use_start_frame=1

