## Put comments here that give an overall description of what your
## functions do

##The first function takes a matrix and sets the inverse variable to null;
##then it creates four functions that allow the user to set the matrix in a
##different eivironment, return the value of the matrix, set the value of the
##inverse in a different environment, and get the value of the inverse from
##the different environment; and finally returns a list with all of
##the nested functions

##The second function takes the list of values from the first function, 
##determines whether the inverse has already been calculated,
##then either calculates the inverse if it hasn't and returns the inverse,
##or simply returns the inverse

## Write a short comment describing this function

##sets and caches the matrix, and creates a list of functions for getting and
##setting the matrix and its inverse respectively

makeCacheMatrix <- function(x = matrix()) {
    
    inMat <- NULL
    
    set <- function(y){
        x <<- y
        inMat <<- NULL
    }
    
    get <- function() x
    setInMat <- function(s) inMat <<- s
    getInMat <- function() inMat
    
    list(set = set, get = get, setInMat = setInMat, getInMat = getInMat)
}


## Write a short comment describing this function

##determines if the inverse has already been calculated by the previous,
##matrix, calculates the matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' 
    inMat <- x$getInMat()
    
    if(!is.null(inMat)){
        message("is getting cached")
        return(inMat)
    }
    data <- x$get()
    inMat <- solve(data, ...)
    x$setInMat(inMat)
    inMat
}