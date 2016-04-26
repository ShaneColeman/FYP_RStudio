#install.packages("seewave")
#install.packages("tuneR")
#install.packages("audio")

library(seewave)
library(tuneR)
#library(audio)

ironMaiden <- readWave(filename = "Iron Maiden - Run To The Hills - 5.wav")
str(ironMaiden)
summary(ironMaiden)

ironMaidenMono <- mono(ironMaiden, which = c("both"))
str(ironMaidenMono)
summary(ironMaidenMono)

#Time length of clipped mono track
numOfSamples <- 230731
numOfSamples / ironMaidenMono@samp.rate

#Confirm that the clipped track is mono and not stereo 
ironMaidenMonoLeft <- ironMaidenMono@left
summary(ironMaidenMonoLeft)
min(ironMaidenMonoLeft)
max(ironMaidenMonoLeft)

ironMaidenMonoRight <- ironMaidenMono@right
summary(ironMaidenMonoRight)
min(ironMaidenMonoRight)
max(ironMaidenMonoRight)

ironMaidenMonoLeft <- ironMaidenMonoLeft / 2 ^ (ironMaidenMono@bit -1)
summary(ironMaidenMonoLeft)

ironMaidenMonoLength <- length(ironMaidenMonoLeft)
ironMaidenMonoFFT <- fft(ironMaidenMonoLeft,ironMaidenMonoLength)

ironMaidenRMS <- rms(ironMaidenMonoLeft)
ironMaidenRMS

rmsTodB <- 20 * log10(0.2597691)
rmsTodB
