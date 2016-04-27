#install.packages("seewave")
#install.packages("tuneR")
#install.packages("audio")

#http://samcarcagno.altervista.org/blog/basic-sound-processing-r/?doing_wp_cron=1461188589.7776970863342285156250

library(seewave)
library(tuneR)
#library(audio)

#Sampling Frequency: 44100 Hertz or 44.1kHz

ironMaiden <- readWave(filename = "Iron Maiden - Run To The Hills - 5.wav")
str(ironMaiden)
summary(ironMaiden)

ironMaidenMono <- mono(ironMaiden, which = c("both"))
str(ironMaidenMono)
summary(ironMaidenMono)

#Time length of clipped mono track
numOfSamplesIronMaiden <- 230731
numOfSamplesIronMaiden / ironMaidenMono@samp.rate

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
ironMaidenMonoFFT <- fft(ironMaidenMonoLeft)

ironMaidenRMS <- rms(ironMaidenMonoLeft)
ironMaidenRMS #0.2597691

#http://uk.mathworks.com/matlabcentral/newsreader/view_thread/164978
rmsTodBIronMaiden <- 10 * log10(0.2597691)
rmsTodBIronMaiden #-5.854125

################

#Sampling Frequency: 44100 Hertz or 44.1kHz

motorhead <- readWave(filename = "Motorhead - Ace of Spades 5.wav")
str(motorhead)
summary(motorhead)

motorheadMono <- mono(motorhead, which = c("both"))
str(motorheadMono)
summary(motorheadMono)

#Time length of clipped mono track
numOfSamplesMotorhead <- 229304
numOfSamplesMotorhead / motorheadMono@samp.rate

#Confirm that the clipped track is mono and not stereo 
motorheadMonoLeft <- motorheadMono@left
summary(motorheadMonoLeft)
min(motorheadMonoLeft)
max(motorheadMonoLeft)

motorheadMonoRight <- motorheadMono@right
summary(motorheadMonoRight)
min(motorheadMonoRight)
max(motorheadMonoRight)

motorheadMonoLeft <- motorheadMonoLeft / 2 ^ (motorheadMono@bit -1)
summary(motorheadMonoLeft)

motorheadMonoLength <- length(motorheadMonoLeft)
motorheadMonoFFT <- fft(motorheadMonoLeft)

motorheadRMS <- rms(motorheadMonoLeft)
motorheadRMS #0.2452614

#http://uk.mathworks.com/matlabcentral/newsreader/view_thread/164978
rmsTodBMotorhead <- 10 * log10(0.2452614)
rmsTodBMotorhead #-5.854125

