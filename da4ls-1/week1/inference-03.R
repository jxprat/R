library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)

population <- read.csv(filename)
population <- unlist(population) # turn it into a numeric

n <- 10000
null <- vector("numeric",n)
for(i in 1:n) {
   # get 12 control mice ...
   control <- sample(population, 12)
   # get another 12 more ...
   treatment <- sample(population, 12)
   null[i] <- mean(treatment) - mean(control)
}

# from previous calculations we don't have now ...
# obs = mean(treatment) - mean(control)
obs = 3.020833

# let's get the P value ...
# the probability the null hypo is true
mean(abs(null) > obs)
