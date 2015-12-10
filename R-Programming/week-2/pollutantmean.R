pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result! 217.77.17

  valors <- vector("numeric")
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
    valors <- c(valors, dat[[pollutant]])
  }
  mean(valors, na.rm = TRUE)
}
