# load libs ...
library(dplyr)

# get data
dat <- read.csv("femaleMiceWeights.csv")

# separete the 2 group data
control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist

print(mean(control))
print(mean(treatment))

obsdiff <- mean(treatment) - mean(control)
print(obsdiff)

