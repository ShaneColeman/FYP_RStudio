#******************************************************************
#Title: Music_Information_Retrieval.R Script
#Date: 2016
#Author: Shane Coleman
#Date Created: April 2016
#Modified: User Created R Script (Music_Information_Retrieval.R)
#Modified / Refactored Code Referenced Below
#******************************************************************

#install.packages("seewave")
#install.packages("tuneR")
#install.packages("audio")

library(seewave)
library(tuneR)
#library(audio)

#*********************************************************************************************
#Title: Basic Sound Processing with R
#Site Owner / Sponsor: AlterVista
#Date: 10 December 2013
#Author: samcarcagno
#Availability:http://samcarcagno.altervista.org/blog/basic-sound-processing-r/?doing_wp_cron=1461188589.7776970863342285156250
#Date Accessed: April 2016
#Modified: Code refactord (variables and date frames altered, WAV file supplied)

ironMaiden <- readWave(filename = "Iron Maiden - Run To The Hills - 5.wav")
summary(ironMaiden)
str(ironMaiden)

ironMaidenMono <- mono(ironMaiden, which = c("both"))
summary(ironMaidenMono)
str(ironMaidenMono)

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
ironMaidenMonoLength
ironMaidenMonoFFT <- fft(ironMaidenMonoLeft)
ironMaidenMonoFFT

ironMaidenRMS <- rms(ironMaidenMonoLeft)
ironMaidenRMS #0.2597691
#*********************************************************************************************

#******************************************************************
#Title: Conducting FFT on a WAV file
#Site Owner / Sponsor: http://uk.mathworks.com
#Date: 3rd March 2008
#Author: Ken
#Availability: http://uk.mathworks.com/matlabcentral/newsreader/view_thread/164978
#Date Accessed: April 2016
#Modified: Code refactord (variable name, equation and log10 function altered)

rmsTodBIronMaiden <- 10 * log10(0.2597691)
rmsTodBIronMaiden 
#******************************************************************



##########################################################################################################

# #Sampling Frequency: 44100 Hertz or 44.1kHz
# 
# motorhead <- readWave(filename = "Motorhead - Ace of Spades 5.wav")
# str(motorhead)
# summary(motorhead)
# 
# motorheadMono <- mono(motorhead, which = c("both"))
# str(motorheadMono)
# summary(motorheadMono)
# 
# #Time length of clipped mono track
# numOfSamplesMotorhead <- 229304
# numOfSamplesMotorhead / motorheadMono@samp.rate
# 
# #Confirm that the clipped track is mono and not stereo 
# motorheadMonoLeft <- motorheadMono@left
# summary(motorheadMonoLeft)
# min(motorheadMonoLeft)
# max(motorheadMonoLeft)
# 
# motorheadMonoRight <- motorheadMono@right
# summary(motorheadMonoRight)
# min(motorheadMonoRight)
# max(motorheadMonoRight)
# 
# motorheadMonoLeft <- motorheadMonoLeft / 2 ^ (motorheadMono@bit -1)
# summary(motorheadMonoLeft)
# 
# motorheadMonoLength <- length(motorheadMonoLeft)
# motorheadMonoFFT <- fft(motorheadMonoLeft)
# 
# motorheadRMS <- rms(motorheadMonoLeft)
# motorheadRMS #0.2452614
# 
# #http://uk.mathworks.com/matlabcentral/newsreader/view_thread/164978
# rmsTodBMotorhead <- 10 * log10(0.2452614)
# rmsTodBMotorhead #-5.854125

