import os
import shutil

main = '../../resources/compiled'

for i in os.listdir(main):
    subpath = os.path.join(main, i)
    list_files = os.listdir(subpath)
    print('\nworking on : ', i)
    with open(os.path.join(subpath, i + '_all.txt'),'wb') as wfd:
        for f in list_files:
            print('copying : ', f)
            with open(os.path.join(subpath, f),'rb') as fd:
                wfd.write(fd.read())
        print('\ndone with : ', i)        

