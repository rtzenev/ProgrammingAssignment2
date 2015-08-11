## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
