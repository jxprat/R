library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed(1)
n <- 1000
v <- vector("numeric", n)
for(i in 1:n) {
  v[i] <- mean(sample(x, 50))
}

nor <- mean(x)
mean(v > (nor + 1)) + mean (v < (nor -1))

hist(v) ##take a look
mean( abs( v - mean(x) ) > 1)


