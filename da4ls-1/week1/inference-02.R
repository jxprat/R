library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)
population <- read.csv(filename)
population <- unlist(population) # turn it into a numeric

# lets take 3 different 12 elemnts samples
control1 <- sample(population,12)
control2 <- sample(population,12)
control3 <- sample(population,12)

# now lets get each mean ...
mean(control1)
mean(control2)
mean(control3)

