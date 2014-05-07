'''
Created on Apr 2, 2014

@author: liang
'''
from sklearn.ensemble import RandomForestClassifier
from sklearn.cross_validation import cross_val_score
import time
import pandas as pd


def read_datafile(datafile,showtime = False):
#     To read the data from data file ".csv" to pandas data framework 
#     The return value is pandas data framework
     start_time = time.time()
     result = pd.read_csv(datafile)
     if showtime:
         print "Time for reading data from data : " + start_time


## train the model of random forest

file = "test.csv"
train_data = readdata(file)
clf = RandomForestClassifier(n_estimators=30)
X = train_data[:,0:-1]
y = rain_data[:,-1]
clf = cfl.fit(X,y)

## use cross validation to test the model
scores = cross_val_score(clf, X, y)

## print the score 
print score.mean()

     
     



