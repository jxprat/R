corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
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
    
  }
}