library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

# Exercise 1
# If a list of numbers has a distribution that is well approximated by 
# the normal distribution, what proportion of these numbers are within 
# one standard deviation away from the list's average?
pnorm(1) - pnorm(-1)

# Exercise 2
# What proportion of these numbers are within two standard deviations
# away from the list's average?
pnorm(2) - pnorm(-2)

# Exercise 3
# What proportion of these numbers are within three 
# standard deviations away from the list's average?
pnorm(3) - pnorm(-3)

# Exercise 4
# Define y to be the weights of males on the control diet. 
# What proportion of the mice are within one standard deviation away
# from the average weight (remember to use popsd for the population sd)?
library(dplyr)
library(rafalib)
y <- filter(dat,Sex=="M") %>% filter(Diet=="chow") %>% select(Bodyweight) %>% unlist



