python data/create_video_db.py \
--list_file=data/list/kth/validationHough3.txt \
--output_file=data/lmdb/kth/validationHough3 \
--shuffle_data=1

python data/create_video_db.py \
--list_file=data/list/kth/testHough3.txt \
--output_file=data/lmdb/kth/testHough3 \
--shuffle_data=1

python data/create_video_db.py \
--list_file=data/list/kth/trainingHough3.txt \
--output_file=data/lmdb/kth/trainingHough3 \
--shuffle_data=1

