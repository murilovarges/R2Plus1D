# create npdi lists for 5 splits
i=0
while [ $i -lt 5 ]; \
do \
    python data/create_video_lists.py \
       --video_list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/npdi/fold${i}_video.txt \
       --output_dir=/home/murilo/PycharmProjects/R2Plus1D/data/list/npdi \
       --output_filename=fold${i}_video_id_dense_l32.txt
    i=$((i+1))
done
