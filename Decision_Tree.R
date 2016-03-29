#Decision Tree
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

#Read Decision Tree in musicData Data Frame, Seperator is a comma, Header is present
#and convert strings into factors is true.
musicData <- read.csv("MusicDataSet.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE)

colnames(musicData) <- c("author.song.duration", "tempo.bpm.", "rms.dB.",
												 "samp.freq.kHz.", "samp.rate.b.", "dyn.range.dB.",
												 "tonality", "num.dig.errors", "genre")

#Use sapply function to list all the columns within the musicData Data Frame and using the
#class function, return back the class of each column. In other words what type the columns
#are in the musicData Data Frame Matrix.
sapply(musicData, FUN = class)

#Displays summary information about the musicData Data Frame
summary(musicData)

#Convert the Data Frame from its original data types to numeric type
musicData[1:9] <- sapply(musicData[1:9],as.numeric)
sapply(musicData, FUN = class)

#Displays summary information about the musicData Data Frame, 
#now converted to type numeric
summary(musicData)

#Global environment variables set to columns within the data frame
authorSongDuration <- musicData$author.song.duration
tempo <- musicData$tempo.bpm.
rootMeanSquare <- musicData$rms.dB.
samplingFrequency <- musicData$samp.freq.kHz.
samplingRate <- musicData$samp.rate.b.
dynamicRange <- musicData$dyn.range.dB.
tonality <- musicData$tonality
digitalErrors <- musicData$num.dig.errors
genre <- musicData$genre

genrePrediction <- rpart(genre ~ tempo + rootMeanSquare + 
												 	samplingFrequency + dynamicRange + tonality + digitalErrors, 
						 								data = musicData, method = "class")

plot(genrePrediction, main = "Music Genre Classification")
text(genrePrediction, cex = 0.9)
legend(2.1,1,c("Legend\n1: Classical","2: Folk","3: Jazz","4: Rock"))

prp(genrePrediction, main = "Music Genre Classification")

fancyRpartPlot(genrePrediction, cex = 0.55, 
							 main = "Music Genre Classification - Decision Tree\n\n\n")

