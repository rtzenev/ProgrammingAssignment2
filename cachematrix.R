## makeCacheMatrix takes as an argument a real matrix
## and returns a list of three functions to get the matrix, set and get its inverse
## it keeps the inverse matrix in variable inverse which is set through setinverse()
## it returns the inverse matrix through getinverse() by returning the variable inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  getinverse <- function(){
    inverse
  }
  
  setinverse <- function(inv){
    inverse <<- inv
  }
  
  getmatrix <- function() {
    x
  }
  
  list(getinverse = getinverse, 
       setinverse = setinverse, 
       getmatrix  = getmatrix)

}

## CacheSove() takes as an argument the output of makeCacheMatrix
## which is a list of 3 functions to get the real matrix, get and set its inverse 
## getinverse() will return the cached inverse if available
## if not regular solve() function calculates the inverse and sets it throuhj setinverse() 

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if (!is.null(inverse)){
    message("Getting cached inverse matrix....")
    return(inverse)
  }
  
  matrix <- x$getmatrix()
  inverse <- solve(matrix, ...)
  x$setinverse(inverse)
  inverse
  
}
