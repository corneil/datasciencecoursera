## Functions that will create an object that can be used to cache the inverse of the matrix.

## Create an object with a methods and place holder for holding the solved inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        ## If x is modified set i to NULL
        x <<- y
        i <<- NULL        
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Return the place holder if not NULL other solve the inverse
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
            return(i)
        }
        data <- x$get()
        print(class(data))
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
