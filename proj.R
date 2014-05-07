### Author Liang and Fande

### load data from local data file
TrainData = read.csv("C:/Users/liang/Desktop/class/machine learning/project/data/forest_train.csv")
ValidationData = read.csv("C:/Users/liang/Desktop/class/machine learning/project/data/forest_validation.csv")
TestData = read.csv("C:/Users/liang/Desktop/class/machine learning/project/data/forest_test.csv",header = FALSE)

### load library we need use
library(e1071)
library(rpart)


### define some index and data frame
Exindex = 11:50
Trainset = TrainData[,-Exindex]
Validationset = ValidationData[,-Exindex]
Testset = TestData[,-Exindex]


#svm for pruning data for radial model
colnames(Trainset)[11] = c("V11")
colnames(Validationset)[11] = c("V11")
ptm = proc.time()
svm.model = svm(Trainset[1:30000,1:10], Trainset[1:30000,11] ,type = "C-classification",kernel="radial")
svm.pred  = predict(svm.model, Validationset[1:8000,-11])
svm_resultTable = table(pred = svm.pred, true = Validationset[1:8000,11])
svm_resultTable
proc.time() - ptmTest

#svm for pruning data for sigmoid model
colnames(Trainset)[11] = c("V11")
colnames(Validationset)[11] = c("V11")
ptm = proc.time()
svm.model = svm(V11 ~ ., data = Trainset[1:1000,] ,type = "C-classification",kernel="sigmoid")
svm.pred  = predict(svm.model, Validationset[1:100,-11])
svm_resultTable = table(pred = svm.pred, true = Validationset[1:100,11])
svm_resultTable
proc.time() - ptm

pred = predict(svm.model, Testset)


## raw svm
ptm = proc.time()
svm.model <- svm(~.,data = TrainData[1:800,], cost = 100, gamma = 1)
svm.pred <- predict(svm.model, ValidationData[1:300,-51])
table(pred = svm.pred, true = ValidationData[1:300,51])

proc.time() - ptm