# CTL and t-distribution in practice Exercises

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

# Exercise 1 & 2
set.seed(1)
n <- 100
#n <- 30
sides <- 6
p <- 1/sides
# p <- 0.5
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

# Exercise 3
library(dplyr)
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(X)

# Exercise 4 
# X¯ follows a normal distribution with mean μX and 
# standard deviation σX√(12) where σX is the 
# population standard deviation. 

print(mean(X) / sqrt(length(X)))

# Exercise 6
sd(X)


