#Attributes: Sampling Frequency, Tempo, Root Mean Square, Dynamic Range

#TrainNorm.csv
musicDataSetTrain <- read.csv("TrainNorm.csv", sep = ",", stringsAsFactors = TRUE, header = FALSE)
sapply(musicDataSetTrain, class)

train4Attributes <- musicDataSetTrain[c(2,3,4,6,9:12)]
sapply(train4Attributes, class)

names(train4Attributes) <- NULL
head(train4Attributes)

write.csv(train4Attributes, file = "TrainNorm5Attributes.csv", row.names = FALSE)


#TestNorm.csv
musicDataSetTest <- read.csv("TestNorm.csv", sep = ",", stringsAsFactors = TRUE, header = FALSE)
sapply(musicDataSetTest, class)

test4Attributes <- musicDataSetTest[c(2,3,4,6,9:12)]
sapply(test4Attributes, class)

names(test4Attributes) <- NULL
head(test4Attributes)

write.csv(test4Attributes, file = "TestNorm5Attributes.csv", row.names = FALSE)
