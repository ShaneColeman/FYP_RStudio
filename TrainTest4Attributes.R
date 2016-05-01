#Attributes: Sampling Frequency, Tempo, Root Mean Square, Dynamic Range
#TrainNorm.csv
musicDataSetTrain <- read.csv("TrainNorm.csv", sep = ",", 
															stringsAsFactors = TRUE, header = FALSE)

sapply(musicDataSetTrain, class)

train4Attributes <- musicDataSetTrain[c(2,3,4,6,9:12)]
sapply(train4Attributes, class)

#******************************************************************
#Title: How do you delete the header in a dataframe?
#Site Owner / Sponsor: stackoverflow.com
#Date: 2013
#Author: Karsten W.
#Availability: http://stackoverflow.com/questions/18175602/how-do-you-delete-the-header-in-a-dataframe
#Date Accessed: March 2016
#Modified: Code refactord (Data frame altered)

names(train4Attributes) <- NULL
head(train4Attributes)
#******************************************************************

write.csv(train4Attributes, file = "TrainNorm4Attributes.csv", row.names = FALSE)

#Attributes: Sampling Frequency, Tempo, Root Mean Square, Dynamic Range
#TestNorm.csv
musicDataSetTest <- read.csv("TestNorm.csv", sep = ",", 
														 stringsAsFactors = TRUE, header = FALSE)

sapply(musicDataSetTest, class)

test4Attributes <- musicDataSetTest[c(2,3,4,6,9:12)]
sapply(test4Attributes, class)

#******************************************************************
#Title: How do you delete the header in a dataframe?
#Site Owner / Sponsor: stackoverflow.com
#Date: 2013
#Author: Karsten W.
#Availability: http://stackoverflow.com/questions/18175602/how-do-you-delete-the-header-in-a-dataframe
#Date Accessed: March 2016
#Modified: Code refactord (Data frame altered)

names(test4Attributes) <- NULL
head(test4Attributes)
#******************************************************************

write.csv(test4Attributes, file = "TestNorm4Attributes.csv", row.names = FALSE)
