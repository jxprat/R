library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed <- 1
n <- 1000
avgsm5 <- vector("numeric", n)
for(i in 1:n) {
   m5 <- sample(x, 5)
   avgsm5[i] <- mean(m5)
}

set.seed <- 1
n <- 1000
avgsm50 <- vector("numeric", n)
for(i in 1:n) {
   m50 <- sample(x, 50)
   avgsm50[i] <- mean(m50)
}

# Exercise 1
# Show the data ...
hist(avgsm5)
hist(avgsm50)

# Exercise 2
# get the proportion between 23 and 25 for the sample of size 50
mean(avgsm50 < 25) - mean(avgsm50 < 23)

# Exercise 3
# The same as ex 2 but with average 23.9 and standard deviation 0.43
new_mu <- 23.9
new_sigma <- 0.43
pnorm(25, new_mu, new_sigma) - pnorm(23, new_mu, new_sigma)
