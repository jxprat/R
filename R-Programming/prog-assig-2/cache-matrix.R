## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##
## This function let us create (set) a matrix, get it's content,
## store its inverse (setinverse) and get (if it has) its inverse (getinverse)

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  get <- function() x
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  setinverse <- function (inverse) inv <<- inverse
  getinverse <- function () inv
  list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
##
## This function compute the inverse of a cacheable matrix
## we have created with makeCacheMatrix
## If the value it's not calculated before (x$getinverse == NULL)
## then we compute the inverse and also we store the result for other uses

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(is.null(inv)) {
    # The inverse is not cached, so we should calculate it and cache it
    tmp <- x$get() %*% x$get()
    inv <- solve(tmp)
    x$setinverse(inv)
  }
  # In any case, now, inv has the inverse of the matrix
  # So, we must return inv!!
  inv
}

