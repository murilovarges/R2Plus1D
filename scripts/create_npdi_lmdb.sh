#!/usr/bin/env bash
# create npdi dataset for 5 splits
i=1
while [ $i -lt 6 ]; \
do \
	if [ $i -eq 1 ]; then
		fold_test="fold0"
		fold_train="fold1234"
	elif [ $i -eq 2 ]; then
		fold_test="fold1"
		fold_train="fold0234"
	elif [ $i -eq 3 ]; then
		fold_test="fold2"
		fold_train="fold0134"
	elif [ $i -eq 4 ]; then
		fold_test="fold3"
		fold_train="fold0124"
	elif [ $i -eq 5 ]; then
		fold_test="fold4"
		fold_train="fold0123"
	fi

	echo $fold_test 
	echo $fold_train 

	python data/create_video_db.py \
	--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/npdi/${fold_test}.txt \
	--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/${fold_test} \
	--shuffle_data=1

	python data/create_video_db.py \
	--list_file=/home/murilo/PycharmProjects/R2Plus1D/data/list/npdi/${fold_train}.txt \
	--output_file=/home/murilo/PycharmProjects/R2Plus1D/data/lmdb/npdi/${fold_train} \
	--shuffle_data=1
	i=$((i+1))
done
