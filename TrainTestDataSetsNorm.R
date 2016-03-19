#http://stackoverflow.com/questions/17200114/
#how-to-split-data-into-training-testing-sets-using-sample-function-in-r-program

testDataSetNorm <- read.csv("MusicDataNorm.csv")

#50% of whole data set
sizeDataSet <- floor(0.50 * nrow(testDataSetNorm))

set.seed(11)

rowsLengthSize <- sample(seq_len(nrow(testDataSetNorm)),size = sizeDataSet)

train <- testDataSetNorm[rowsLengthSize,]
test <- testDataSetNorm[-rowsLengthSize,]
