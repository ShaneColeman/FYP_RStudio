install.packages("tuneR")
library(tuneR)

audio <- file.path("metal.00005.au")
info <- file.info(audio)

show(audio)
