corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  vec <- vector("numeric")
  ndx <- 1
  for (num in 1:332) {
    num <- toString(num)
    if(nchar(num) == 1) {
      nom <- paste("00", num, ".csv", sep='')
    } else if(nchar(num) == 2) {
      nom <- paste("0", num, ".csv", sep = '')
    }
    else {
      nom <- paste(num, ".csv", sep='')
    }
    # 
    # Mejor usar list.files(directory) que devuelve un vector con los
    # nombres de todos los ficheros que hay alli. Recorremos el vector ...
    #
    nom <- paste(directory, "/", nom, sep = '')
    dat <- read.csv(nom)
    
    if(sum(complete.cases(dat[["sulfate"]], dat[["nitrate"]])) > threshold) {
      vec[ndx] <- cor(dat[["sulfate"]], dat[["nitrate"]], use = "complete.obs")
      ndx <- ndx + 1
    }
  }
  return(vec)
}
