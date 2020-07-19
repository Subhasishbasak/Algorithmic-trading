import os

path = ['../../resources/2017',  '../../resources/2018']
path = ['../../resources/2018']

for k in path:
    level_1 = os.listdir(k)
    for i in level_1:
        level_2 = os.listdir(os.path.join(k, i))
        for l in level_2:
            level_3 = os.listdir(os.path.join(k, i, l))
            for j in level_3:
                if j.endswith('.txt'):
                    print('moving file : ', j)
                    try:
                        os.mkdir(os.path.join('../../resources', j.split('.')[0]), mode = 0o666)
                    except FileExistsError:
                        pass
                    new_name = j.split('.')[0] + str(i) + str(l) + str(j)
                    os.rename(os.path.join(k, i, l, j), 
                            os.path.join('../../resources', j.split('.')[0], new_name))
                    print('successfully moved')
                    print('COMPLETED j :', j)
                    print('COMPLETED i :', i)
                    print('COMPLETED k :', k)
