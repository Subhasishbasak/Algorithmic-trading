import os
import zipfile

path = ['../../resources/2017', 
        '../../resources/2018']

for i in path:
    folders = os.listdir(i)
    for j in folders:
        files = os.listdir(os.path.join(i,j))
        for k in files:
            if k.endswith('.zip'):
                file_path = os.path.join(i,j,k)
                print("file unzipping : ", file_path)
                with zipfile.ZipFile(file_path, 'r') as zip_ref:
                    zip_ref.extractall(os.path.join(i,j))
                print("sucessfully unzipped")   
                print("deleting file : ", file_path)
                os.remove(file_path)


