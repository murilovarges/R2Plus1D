# create npdi lists for 5 splits
i=0
while [ $i -lt 5 ]; \
do \
   python data/create_video_db.py \
	--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/npdi/fold${i}_id_dense_l32.txt \
	--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/fold${i}_dense \
	--use_list=1 --use_video_id=1 --use_start_frame=1
    i=$((i+1))
done
