## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a special matrix which is a list that contains functions to 
## 1) set matrix value 
## 2) get matrix value
## 3) set matrix inverse
## 4) get matrix inverse

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() { 
    x
  }
  
  setinverse <- function(inverse) { 
    m <<- inverse
  }
  
  getinverse <- function() {
    m
  }
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

  m <- x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data, ...)
  
  x$setinverse(m)
  
  m           ## Return a matrix that is the inverse of 'x'
}
