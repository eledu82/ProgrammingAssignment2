## These two functions calculate the inverse of a given matrix

## Return a list of functions
makeCacheMatrix <- function(x = numeric()) {
    cache <- NULL
    set <- function(y) {
        x <<- y
        cache <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) cache <<- solve
    getInverse <- function() cache
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculate the inverse of a matrix if it the firts call, and get it from the cache in sucessive calls
cacheSolve <- function(x, ...) {
    ## Get the inverse matrix (im)
    im <- x$getInverse()
    if(!is.null(im)) {
        message("getting cached data")
        return(im)
    }
    data <- x$get()
    im <- solve(data, ...)
    x$setInverse(im)
    # return the inverse matrix
    im    
}
