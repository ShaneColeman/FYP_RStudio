install.packages("dprep")
library(dprep)

musicDataSet <- read.csv("MusicDataSet.csv", sep = ",", stringsAsFactors = TRUE, header = TRUE)

sapply(musicDataSet, class)

musicDataSet[1:9] <- sapply(musicDataSet[1:9],as.numeric)
sapply(musicDataSet, class)

musicData <- musicDataSet
head(musicData)

write.csv(musicData, file = "MusicData.csv")

musicDataNorm <- mmnorm(musicData[1:9], minval = 0, maxval = 1)
head(musicDataNorm)

write.csv(musicDataNorm, file = "MusicDataNorm.csv",row.names = FALSE)