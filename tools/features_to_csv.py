from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals
from __future__ import print_function

import logging
import numpy as np
import os
import csv
import argparse
import cPickle as pickle

logging.basicConfig()
log = logging.getLogger("features_to_csv")
log.setLevel(logging.INFO)


def create_videos_file_dict(input_file_list):
    files = {}
    with open(input_file_list, 'rb') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            files[int(row['video_id'])] = row['org_video'] + ';' + row['start_frm']
    return files


def features_to_csv(input_file, input_file_list, output_dir):
    videos_dict = create_videos_file_dict(input_file_list)
    with open(input_file, 'r') as fopen:
        blobs = pickle.load(fopen)

    video_id = blobs['video_id']
    feature = blobs['final_avg']
    for i in range(feature.shape[0]):
        features = feature[i]
        id = video_id[i]

        video_info = videos_dict[id].split(";")
        folder_name = video_info[0].split("/")[-2]
        video_name = os.path.basename(video_info[0])
        name, extension = os.path.splitext(video_name)
        file_name = '%s_%06d.csv' % (name, int(video_info[1]))
        full_file_name = os.path.join(output_dir, folder_name, name, file_name)

        if not os.path.exists(os.path.dirname(full_file_name)):
            os.makedirs(os.path.dirname(full_file_name))

        print('[info] saving R2+1D Features {}'.format(full_file_name))
        np.savetxt(
            full_file_name,
            features.reshape(1, features.shape[0]),
            fmt=str('%.16f'),
            delimiter=","
        )


def main():
    parser = argparse.ArgumentParser(
        description="Dense prediction aggregation"
    )
    parser.add_argument("--input_file", type=str, default=None,
                        help="Input file with features file")
    parser.add_argument("--input_file_list", type=str, default=None,
                        help="Path with file with clips ids and name")
    parser.add_argument("--output_dir", type=str, default=None,
                        help="Path to output CSV files")

    args = parser.parse_args()
    features_to_csv(
        args.input_file,
        args.input_file_list,
        args.output_dir

    )


if __name__ == '__main__':
    main()
