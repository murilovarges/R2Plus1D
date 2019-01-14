'''
Script to create kth lists file with videos
    Classes
    0   walking
    1   jogging
    2   running
    3   boxing
    4   handwaving
    5   handclapping
'''
import os
import csv
import platform
import glob


def returnClass(fileName):

    classes = ['walking','jogging','running', 'boxing', 'handwaving','handclapping']
    i = 0
    for c in classes:
        if c in fileName:
            return i
        i = i + 1

def verifyFiles(videosPath, outputListName):
    files = []
    ctd = 0;
    for file in glob.glob(os.path.join(videosPath, "**/*.avi"), recursive=True):
        label = returnClass(file);
        files.append({
            'org_video': file,
            'label': label
        })
        ctd = ctd + 1

    videoCSV = outputListName
    #keys = files[0].keys()
    with open(videoCSV, 'w', newline='') as csvfile:  # Just use 'w' mode in 3.x
        fieldnames = ['org_video', 'label']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for data in files:
            writer.writerow(data)

    print("Total de videos : %i" % ctd)
    print("")


def main():
    OsName = platform.system()
    print('Operating System: ', OsName)

    files = ['/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/testHough3.txt',
             '/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/trainingHough3.txt',
             '/home/murilo/PycharmProjects/R2Plus1D/data/list/kth/validationHough3.txt']

    videos = ['/home/murilo/dataset/KTH/VideosTrainValidationTest_Hough3_Videos/test',
              '/home/murilo/dataset/KTH/VideosTrainValidationTest_Hough3_Videos/training',
              '/home/murilo/dataset/KTH/VideosTrainValidationTest_Hough3_Videos/validation']

    for i in range(0, 3):
        print(files[i])
        print(videos[i])
        verifyFiles(videos[i], files[i])


if __name__ == '__main__':
    main()
