## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = numeric()) {
  
   cache <- NULL
  
  # store the matrix
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  
  getMatrix <- function() {
    x
  }
  
    cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  getInverse <- function() {
    cache
  }
  
  # return a list, which every element is a function.
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix, 
       cacheInverse = cacheInverse, 
       getInverse = getInverse)
}


# Calculates the inverse of a matrix created with 
# makeCacheMatrix
cacheSolve <- function(y, ...) {
  inverse <- y$getInverse()
  if(!is.null(inverse)) {
    message("getting data")
    return(inverse)
  }
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # returning the inverse of the matrix
  inverse
}
