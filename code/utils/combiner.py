import os
import shutil

year = '2018'
main = '../../resources'
path = os.path.join(main, year)

for i in os.listdir(path):
    subpath = os.path.join(path, i)
    subsubpath = os.path.join(subpath, 'NIFTY50_' + i + year)
    for j in os.listdir(subsubpath):
        try:
            os.mkdir(os.path.join(main, j.split('.')[0]))
        except FileExistsError:
            pass
        origin = os.path.join(subsubpath, j)
        destination = os.path.join(main, j.split('.')[0], j.split('.')[0] + '_' + i + '_' + year + '.txt')
        shutil.copyfile(origin, destination)

        
