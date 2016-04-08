## Put comments here that give an overall description of what your
## functions do

## Generate a list containing a function to 
## set the value of a matrix,
## get the value of a matrix,
## Set the value of the inverse of the matrix
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        ## First check if solution available in cached data
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    ## If not available in cached data, solve and return
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
