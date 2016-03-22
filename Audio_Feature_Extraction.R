install.packages("tuneR")
library(tuneR)

audio <- readWave("Resurrection_Clip.wav")

a <- mono(audio)
summary(a)

p <- periodogram(a)

summary(p)

norm <- normalize(audio)
summary(norm)
