# Reshaping data session ...
#
# We want tidy data:
# - Each variable forms a column
# - Each observation forms a row
# - Each table/file stores data about one kind of observation

# Loading the data ...
library(reshape2)
head(mtcars)

# Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt, n=3)
tail(carMelt, n=3)

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
# This means that for cyl=4 we have 11 mesures of mpg and also 11 of hp
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

# Averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)
# Another way - split ...
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns
sprCount <- lapply(spIns, sum)
sprCount
# Yet another way - combine ...
unlist(sprCount)
sapply(spIns, sum)
# More ways with plyr package ...
library(plyr)
ddply(InsectSprays, .(spray), summarize, sum=sum(count))

