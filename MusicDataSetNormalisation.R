#Full List of Attributes
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

musicDataNorm$genre <- musicDataNorm$genre
musicDataNorm$genre2 <- musicDataNorm$genre
musicDataNorm$genre3 <- musicDataNorm$genre
musicDataNorm$genre4 <- musicDataNorm$genre
head(musicDataNorm)

musicDataNorm$genre[musicDataNorm$genre == 1] <- 0
musicDataNorm$genre2[musicDataNorm$genre2 == 1] <- 1
musicDataNorm$genre3[musicDataNorm$genre3 == 1] <- 0
musicDataNorm$genre4[musicDataNorm$genre4 == 1] <- 0

musicDataNorm$genre[musicDataNorm$genre == 2] <- 0
musicDataNorm$genre2[musicDataNorm$genre2 == 2] <- 0
musicDataNorm$genre3[musicDataNorm$genre3 == 2] <- 0
musicDataNorm$genre4[musicDataNorm$genre4 == 2] <- 1

musicDataNorm$genre[musicDataNorm$genre == 3] <- 0
musicDataNorm$genre2[musicDataNorm$genre2 == 3] <- 0
musicDataNorm$genre3[musicDataNorm$genre3 == 3] <- 1
musicDataNorm$genre4[musicDataNorm$genre4 == 3] <- 0

musicDataNorm$genre[musicDataNorm$genre == 4] <- 1
musicDataNorm$genre2[musicDataNorm$genre2 == 4] <- 0
musicDataNorm$genre3[musicDataNorm$genre3 == 4] <- 0
musicDataNorm$genre4[musicDataNorm$genre4 == 4] <- 0

names(musicDataNorm) <- NULL
head(musicDataNorm)

write.csv(musicDataNorm, file = "MusicDataNorm.csv",row.names = FALSE)
