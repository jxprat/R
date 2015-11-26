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
## y <- filter(dat,Sex=="M") %>% filter(Diet=="chow") %>% select(Bodyweight) %>% unlist
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
mean( abs(z) <=1 )

# Exercise 5
# What proportion of these numbers are within two 
# standard deviations away from the list's average?
mean(abs(z) <= 2)

# Exercise 6
# What proportion of these numbers are within three 
# standard deviations away from the list's average?
mean(abs(z) <= 3)

# Exercise 7
# Which of the following best describes the qq-plot 
# comparing mouse weights to the normal distribution?
qqnorm(z)
abline(0,1)

# Exercise 8
# Create the above qq-plot for the four populations: male/females 
# on each of the two diets. What is the most likely explanation for 
# the mouse weights being well approximated? What is the best 
# explanation for all these being well approximated by the 
# normal distribution?
mypar(2,2)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)

# Exercise 9 
# What is the average of the distribution of the sample average?
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)
mean(avgs)

# Exercise 10
# What is the standard deviation of the distribution of sample averages?
sd(avgs)
