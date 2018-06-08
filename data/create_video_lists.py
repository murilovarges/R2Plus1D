'''
Create a file list with videos
'''
import sys
import os
import cv2
from caffe2.python import workspace
import argparse


def get_frame_count(video):
    ''' Get frame counts and FPS for a video '''
    cap = cv2.VideoCapture(video)
    if not cap.isOpened():
        print "[Error] video={} can not be opened.".format(video)
        sys.exit(-6)

    # get frame counts
    num_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    fps = cap.get(cv2.CAP_PROP_FPS)

    # in case, fps was not available, use default of 29.97
    if not fps or fps != fps:
        fps = 29.97

    return num_frames, fps


def create_video_list(
        video_list_file,
        output_dir,
        output_filename,
        num_frames_per_clip=32,
        frame_stride=8,
):
    # generate input file for feature extraction/dense prediction
    input_file = os.path.join(output_dir, output_filename)
    f_input = open(input_file, 'w')
    f_input.write("org_video,label,start_frm,video_id\n")

    video_id = 1
    file_videos = filter(None, (line.rstrip() for line in open(video_list_file)))
    file_videos.pop(0)
    for line in file_videos:
        if line.endswith('\n'):
            break

        video_file = line.split(',')[0]
        label = line.split(',')[1]
        video_name, ext = os.path.splitext(os.path.basename(video_file))
        print "[Info] Processing Video: {}.{}".format(video_name,ext)

        # get frame counts and fps
        num_frames, fps = get_frame_count(video_file)
        print "[Info] num_frames={}, fps={}".format(num_frames, fps)

        frame_inc = frame_stride
        start_frame = 0
        end_frame = num_frames
        start_frames = []
        for frame_index in range(start_frame, end_frame, frame_inc):
            if frame_index + num_frames_per_clip < num_frames:
               print "[Debug] adding frame_index={}".format(frame_index)
               start_frames.append(frame_index)

        for start_frame in start_frames:
            f_input.write("{},{},{},{}\n".format(video_file, label, start_frame, video_id))
            
        video_id = video_id + 1



    f_input.close()


def main():
    parser = argparse.ArgumentParser(
        description="create video database"
    )
    parser.add_argument("--video_list_file", type=str, default=None, required=True,
                        help="Path with list of videos with video full path and label")
    parser.add_argument("--output_dir", type=str, default=None, required=True,
                        help="Path to output dense list file")
    parser.add_argument("--output_filename", type=str, default=None, required=True,
                        help="Filename to output dense list file")
    parser.add_argument("--num_frames_per_clip", type=int, default=32,
                        help="number of frames per clip")
    parser.add_argument("--frame_stride", type=int, default=8,
                        help="frame stride for feature extraction/dense prediction")

    args = parser.parse_args()

    create_video_list(
        args.video_list_file,
        args.output_dir,
        args.output_filename,
        args.num_frames_per_clip,
        args.frame_stride
    )


if __name__ == '__main__':
    workspace.GlobalInit(['caffe2', '--caffe2_log_level=2'])
    main()
