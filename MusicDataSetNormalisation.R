#Full List of Attributes

#http://www.inside-r.org/packages/cran/dprep/docs/mmnorm
install.packages("dprep")
library(dprep)

musicDataSet <- read.csv("MusicDataSet.csv", sep = ",", stringsAsFactors = TRUE, header = TRUE)

#******************************************************************
#Title: Using apply, sapply, lapply in R
#Site Owner / Sponsor: r-bloggers.com
#Date: 2012
#Author: Pete
#Availability: http://www.r-bloggers.com/using-apply-sapply-lapply-in-r/
#Date Accessed: March 2016
#Modified: Code refactord (Data frame altered)

sapply(musicDataSet, class)
#******************************************************************

musicDataSet[1:9] <- sapply(musicDataSet[1:9],as.numeric)
sapply(musicDataSet, class)

musicData <- musicDataSet
head(musicData)

write.csv(musicData, file = "MusicData.csv")

#******************************************************************
#Title: Min-max normalization
#Site Owner / Sponsor: http://finzi.psych.upenn.edu/
#Author: Caroline Rodriguez and Edgar Acuna
#Availability: http://finzi.psych.upenn.edu/library/dprep/html/mmnorm.html
#Other Availability: http://www.public.iastate.edu/~maitra/stat501/Rcode/mmnorm.R
#Date Accessed: March 2016
#Modified: Code refactord (Data frame altered)

musicDataNorm <- mmnorm(musicData[1:9], minval = 0, maxval = 1)
head(musicDataNorm)
#******************************************************************

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

#******************************************************************
#Title: How do you delete the header in a dataframe?
#Site Owner / Sponsor: stackoverflow.com
#Date: 2013
#Author: Karsten W.
#Availability: http://stackoverflow.com/questions/18175602/how-do-you-delete-the-header-in-a-dataframe
#Date Accessed: March 2016
#Modified: Code refactord (Data frame altered)

names(musicDataNorm) <- NULL
head(musicDataNorm)
#******************************************************************

write.csv(musicDataNorm, file = "MusicDataNorm.csv",row.names = FALSE)
