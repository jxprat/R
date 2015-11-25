library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

# We will remove the lines that contain missing values:
dat <- na.omit(dat)

# Exercise 1
# get the population's average of the male mices under the control diet (chow)
library(dplyr)
x <- filter(dat,Sex=="M") %>% filter(Diet=="chow") %>% select(Bodyweight) %>% unlist
mean(x)

# Exercise 2
# Using the "rafalib" use popsd to compute standard deviation
library(rafalib)
popsd(x)

# Exercise 3
# Take a random sample of size 25 and compute the average
set.seed(1)
myX <- sample(x,25)
mean(myX)

# Exercise 4 
# Create a y vector with the body of all males on the high fat (hf) diet.
# What is the population's average?
y <- filter(dat,Sex=="M") %>% filter(Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(y)

# Exercise 5
# Using the rafalib, get the sd with the function popsd
popsd(y)

# Exercise 6
#Take a random sample of size 25. Compute the average
set.seed(1)
myY <- sample(y, 25)
mean(myY)

# Exercise 7
# What is the difference in absolute value between x - y and myX - myY?
abs(abs(mean(x) - mean(y)) - abs(mean(myX) - mean(myY)))

# Exercise 8
# The same as Ex. 7 but for the females ...
xfch <- filter(dat,Sex=="F") %>% filter(Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
myXfch <- sample(xfch, 25)
xfhf <- filter(dat,Sex=="F") %>% filter(Diet=="hf") %>% select(Bodyweight) %>% unlist
set.seed(1)
myXfhf <- sample(xfhf, 25)
abs(abs(mean(xfch) - mean(xfhf)) - abs(mean(myXfch) - mean(myXfhf)))
