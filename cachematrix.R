## Put comments here that give an overall description of what your
## functions do

##  This function caches an input matrix and its inverse 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # sets m to NULL
  set <- function(y){
    x <<- y       # caches the input matrix
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m<<- solve
  getmatrix <- function() m
  list(set = set, get = get, # creates a list
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## This function looks for cached inverse input matrix or calculates it
  cacheSolve <- function(x=matrix(), ...) { ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    if(!is.null(m)){
      message("retrieving cached data")
      return(m)
    }
    matrix <- x$get()
    m <- solve(matrix, ...) #compute the value of the inverse of matrix
    x$setmatrix(m)
    m
  }
