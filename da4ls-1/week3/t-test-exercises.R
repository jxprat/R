library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

# Exercise 1
# Compute the t-statistic (tval)
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, 25)
dat.s <- sample(bwt.smoke, 25)
tval <- t.test(dat.ns, dat.s)
print(tval)

# Exercise 2
# tval <- 2.1209
pval <- 1-(pnorm(abs(2.1209))-pnorm(-abs(2.1209)))
print (pval)

# Exercise 3
print(2*pnorm(-abs(2.1209)))

# Exercise 4
N <- 25
qnorm(0.995)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N )
