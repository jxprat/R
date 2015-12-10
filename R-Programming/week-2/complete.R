complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  ids <- vector("numeric")
  nobs <- vector("numeric")
  ndx <- 1
  for (num in id) {
    num <- toString(num)
    if(nchar(num) == 1) {
      nom <- paste("00", num, ".csv", sep='')
    } else if(nchar(num) == 2) {
      nom <- paste("0", num, ".csv", sep = '')
    }
    else {
      nom <- paste(num, ".csv", sep='')
    }
    nom <- paste(directory, "/", nom, sep = '')
    dat <- read.csv(nom)
    ids[ndx] <- num
    nobs[ndx] <- sum(complete.cases(dat[["sulfate"]], dat[["nitrate"]]))
    ndx <- ndx + 1
  }
  data.frame(ids, nobs)
}