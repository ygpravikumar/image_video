import os
path = './'
files = os.listdir(path)
i = 1

for file in files:
	if '.jpg' in file:
		os.rename(os.path.join(path, file), os.path.join(path, str(i)+'.jpg'))
		i = i+1