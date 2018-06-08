import os
import csv
import platform

def verifyFolders(path, list ):
	file = open(list,'r')
	ctd = 0;
	for line in file:
		line = line.replace('\n','')
		if len(line) == 0:
			continue
		ctd = ctd + 1	
		if "vNonPorn" in line:
			searchDir = path+'vNonPornDifficulty'+os.sep+line
			if not os.path.exists(searchDir):
				searchDir = path+'vNonPornEasy'+os.sep+line
				if not os.path.exists(searchDir):
					print(searchDir.split("\\")[-1])
		else:
			searchDir = path+'vPorn'+os.sep+line
			if not os.path.exists(searchDir):
				print(searchDir.split("\\")[-1])
	print("Total de videos : %i"%ctd)
	print("")

def verifyFiles(path, list, create_csv = False ):
	file = open(list,'r')
	ctd = 0;
	files = []
	
	for line in file:
		line = line.replace('\n','')
		line = line.replace('\r','')
		if len(line) == 0:
			continue
		fileExist = True
		ctd = ctd + 1	
		if "vNonPorn" in line:
			label = 0
			searchFile = "%s%s%s%s%s"%(path,'vNonPornDifficulty', os.sep, line, '.avi')
			if not os.path.isfile(searchFile):
				searchFile = "%s%s%s%s%s"%(path,'vNonPornEasy', os.sep, line, '.avi')
				if not os.path.isfile(searchFile):
					print(searchFile)
					print(searchFile.split(os.sep)[-1])
					fileExist = False
		else:
			label = 1
			searchFile = "%s%s%s%s%s"%(path,'vPorn', os.sep, line, '.avi')
			if not os.path.isfile(searchFile):
				print(searchFile)
				print(searchFile.split(os.sep)[-1])
				fileExist = False

		if fileExist:
			files.append({
				'org_video':searchFile,
				'label':label
				})

	if create_csv:

		videoCSV = os.path.basename(list)
		keys = files[0].keys()
		with open(videoCSV, 'w', newline='') as csvfile:  # Just use 'w' mode in 3.x
			fieldnames = ['org_video', 'label']
			writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
			writer.writeheader()
			#w = csv.DictWriter(f, keys)
			#w.writeheader()
			for data in files:
				writer.writerow(data)		

	print("Total de videos : %i"%ctd)
	print("")


def main():
	OsName = platform.system()
	print('Operating System: ', OsName)

	typeVal = "Video"  # Video or Segments
	if OsName == 'Windows':
		if typeVal == "Video":
			base_path = '\\Projects\\DataSets\\NPDI\\db\\Database\\'
			test_path = '\\Projects\\DataSets\\NPDI\\test\\fold%i_video.txt'
			train_path = '\\Projects\\DataSets\\NPDI\\training\\fold%s_video.txt'
		else:
			base_path = '\\Projects\\DataSets\\NPDI\\Segments\\'
			test_path = '\\Projects\\DataSets\\NPDI\\test\\fold%i.txt'
			train_path = '\\Projects\\DataSets\\NPDI\\training\\fold%s.txt'
	else:
		if typeVal == "Video":
			base_path = '/home/murilo/dataset/NPDI/Database/'
			test_path = '/home/murilo/dataset/NPDI/test/fold%i_video.txt'
			train_path = '/home/murilo/dataset/NPDI/training/fold%s_video.txt'
		else:
			base_path = '/home/murilo/dataset/NPDI/Database/Segments/'
			test_path = '/home/murilo/dataset/NPDI/test/fold%i.txt'
			train_path = '/home/murilo/dataset/NPDI/training/fold%s.txt'

	

	for i in range(0,5):
		test_path_full = test_path%i
		print(test_path_full.split("\\")[-1])
		verifyFiles(base_path,test_path_full,True)

	for i in range(0,5):
		train = "";
		if i != 0:
			train = train + "0"
		if i != 1:
			train = train + "1"
		if i != 2:
			train = train + "2"
		if i != 3:
			train = train + "3"
		if i != 4:
			train = train + "4"

		train_path_full = train_path%train
		print(train_path_full.split("\\")[-1])
		verifyFiles(base_path,train_path_full,True)

if __name__ == '__main__':
	main()
