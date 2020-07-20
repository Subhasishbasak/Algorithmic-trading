import os
import shutil

main = '../../resources/compiled'

for i in os.listdir(main):
    subpath = os.path.join(main, i)
    
    print('removing old script')
    os.remove(os.path.join(subpath, i + '_all.txt'))
    
    list_files = os.listdir(subpath)
    ref = {'JAN':0, 'FEB':1, 'MAR':2, 'APR':3, 'MAY':4, 'JUN':5, 'JUL':6, 'AUG':7, 'SEP':8, 'OCT':9, 'NOV':10, 'DEC':11}
    try:
        list_files = sorted(list_files, key=lambda x: ref[x.split('_')[1]])
    except KeyError:
        list_files = sorted(list_files, key=lambda x: ref[x.split('_')[2]])
    list_files = sorted(list_files, key=lambda x: x.split('_')[-1].split('.')[0])


    print('\nworking on : ', i)
    with open(os.path.join(subpath, i + '_all.txt'),'wb') as wfd:
        for f in list_files:
            print('copying : ', f)
            with open(os.path.join(subpath, f),'rb') as fd:
                wfd.write(fd.read())
        print('\ndone with : ', i)        

