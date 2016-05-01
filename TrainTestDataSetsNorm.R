set.seed(11)

testDataSetNorm <- read.csv("MusicDataNorm.csv",header = FALSE)
head(testDataSetNorm)

#Set the header names to null, represented as NA
names(testDataSetNorm) <- NULL

#************************************************************************************************
#Title: How to split data into training/testing sets using sample function in R program
#Site Owner / Sponsor: stackoverflow.com
#Date: 2014
#Author: dickoa
#Availability: http://stackoverflow.com/questions/17200114/how-to-split-data-into-training-testing-sets-using-sample-function-in-r-program
#Date Accessed: March 2016
#Modified: Code refactord (Data frames and variable names altered)

#50% of whole data set: MusicDataNorm.csv, stored in variable 'testDataSetNorm'
sizeDataSet <- floor(0.50 * nrow(testDataSetNorm))

rowsLengthSize <- sample(seq_len(nrow(testDataSetNorm)),size = sizeDataSet)

train <- testDataSetNorm[rowsLengthSize,]
head(train)

test <- testDataSetNorm[-rowsLengthSize,]
head(test)
#************************************************************************************************

write.csv(train, file = "TrainNorm.csv",row.names = FALSE)
write.csv(test, file = "TestNorm.csv",row.names = FALSE)
