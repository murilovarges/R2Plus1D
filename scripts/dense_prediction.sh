#!/usr/bin/env bash
python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_rgb
#--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/dense_features_rgb_train_segments


python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_op_rgb


python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_op_black

#python tools/dense_prediction_aggregation.py \
#--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/npdi/dense_features_of_sports1m_segments

python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_hough1


python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_hough2


python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_hough1_ft


python tools/dense_prediction_aggregation.py \
--input_dir=/home/murilo/PycharmProjects/R2Plus1D/output/kth/dense_features_hough2_ft