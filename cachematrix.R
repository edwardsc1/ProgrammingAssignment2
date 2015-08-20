## Caching the inverse of a matrix - 2 functions are created below makeCacheMatrix to store and 
## retrieve matrix data and cacheSolve, which computes the inverse matrix

## makeCacheMatrix creates a special matrix which is a list that contains functions to 
## 1) set matrix value 
## 2) get matrix value
## 3) set matrix inverse
## 4) get matrix inverse

makeCacheMatrix <- function(x = matrix()) {

  inverse <- NULL   # initialize inverse to NULL
  
  # set : takes matrix y and globally assigns it to matrix x
  set <- function(y) {   
    x <<- y
    inverse <<- NULL  # globally assign NULL value to matrix inverse
  }
  
  # get : returns matrix x
  get <- function() {   
    x
  }
  
  # setinverse : matrix variable "inverse" is globally assigned the value that is passed to the function matrix "tmpinv"
  setinverse <- function(tmpinv) {   
    inverse <<- tmpinv
  }
  
  #getinverse : returns the inverse matrix "inverse"
  getinverse <- function() {  
    inverse
  }
  
  # list to store all previously created functions 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve : checks if matrix is already computed, if not compute matrix inverse
## store the inverse matrix in x and return inverse matrix

cacheSolve <- function(x, ...) {

  matrixinv <- x$getinverse()  # retrieve inverse matrix and assign to variable matrixinv
  
  # checks if matrix inverse already calculated, if it is just return its value
  if(!is.null(matrixinv)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()  # retrieve matrix and assign to variable "data"
  
  matrixinv <- solve(data, ...)  # computes inverse matrix based on variable "data"
  
  x$setinverse(matrixinv) # stores inverse matrix in x
  
  matrixinv          ## Return a matrix that is the inverse of 'x'
}
