import numpy as np
import pandas as pd

def preprocess(path, drop = True):

    df = pd.read_csv(path, header=None)
    df.columns = ['Company', 'Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume']
    df['Date'] = df['Date'].astype(str)

    yearList = []
    monthList = []
    dayList = []
    for values in df['Date']:
        year = values[:4]
        month = values[4:6]
        day = values[6:]
        yearList.append(year)
        monthList.append(month)
        dayList.append(day)

    df['Year'] = yearList
    df['Month'] = monthList
    df['Day'] = dayList

    if drop:
        del df['Date']

    df.to_csv('./data/formatted_ACC_data.csv')

    return

if __name__ == '__main__':

    path = './data/ACC_all.txt'
    preprocess(path, False)
