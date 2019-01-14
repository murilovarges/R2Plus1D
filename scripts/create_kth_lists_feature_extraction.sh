# create kth
python data/create_video_lists.py \
   --video_list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/testHough3.txt \
   --output_dir=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth \
   --output_filename=testHough3_id_dense_l32_stride1.txt --frame_stride=1


python data/create_video_lists.py \
   --video_list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/trainingHough3.txt \
   --output_dir=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth \
   --output_filename=trainingHough3_id_dense_l32_stride1.txt --frame_stride=1


python data/create_video_lists.py \
   --video_list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/validationHough3.txt \
   --output_dir=/home/murilo/PycharmProjects/R2Plus1D/data/list/kth \
   --output_filename=validationHough3_id_dense_l32_stride1.txt --frame_stride=1
