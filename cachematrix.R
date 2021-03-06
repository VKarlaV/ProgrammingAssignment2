## Put comments here that give an overall description of what your
## functions do

## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

## Write a short comment describing this function
## set the value of the matrix
## get the value of the matrix
## set the value of inverted matrix
## get the value of inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInvert <- function(solve) m <<- solve
    getInvert <- function() m
    list(
        set = set, get = get,
        setInvert = setInvert,
        getInvert = getInvert
    )
}


## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInvert()
        if(!is.null(m)){
            message('getting cached data')
            return(m)
        }
        data <- x$get()
        m <- solve(data,...)
        x$setInvert(m)
        m
}
