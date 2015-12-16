# Sample of Caching the Mean of a Vector ...

makeVector <- function (x = numeric()) {
  m <- NULL
  set <- function (y) {
    x <<- y
    m <<- NULL
  }
  get <- function () x
  setmean <- function (mean) m <<- mean
  getmean <- function () m
  list (set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function (x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message ("getting cached data ...")
    return (m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

# Now ... 
# let's see how it works ...

# Create my "special" vector ...
x <- makeVector()
# Set values to this new vector ...
x$set(c(1,2,3,4,5,1,2,7,3,4,5,1,4,9,1,1,2,3))
# Get and see the vector ...
x$get()
# Has its mean calculated (the object)?
x$getmean()
# Cache the mean ...
cachemean(x)
# Get the mean (of the object)
x$getmean()
# Let's get the mean using the cache if it's calculated yet
cachemean(x)
