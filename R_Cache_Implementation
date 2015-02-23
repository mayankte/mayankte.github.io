## Matrix Inverse is a Computationally Expensive Operation. 
## Following Pair of functions , cache the inverse of a matrix and retrieve it from the cache if the same matrix inverse is 
## retrieved by user. 
## For a new unseen matrix, the inverse is newly calculated and pushed into the aformentioned cache

## Note: This Code is an enhancement to Prof. Roger Peng's Code (Johns Hopkins University) and is based on his framework of
cache implementation


## Part 1: makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        # Initializes an empty matrix
        In <- NULL
        # Set the inverse to NULL
        
        set <- function(y){
                x <<- y
                In <<- NULL
                # Once the set function is called, Inverse is re-set to NULL
        }
        get <- function() x
        # get function returns the matrix
        
        setInverse <- function(solve) In <<- solve
        # setInverse overrides the previous value of In and assigns the argument to Inverse (which is supposed to be the inverse of matrix x)
        
        getInverse <- function() In
        # getInverse returns the Inverse
        
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
        # creates a list of the functions
        
}

# Part 2: cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        In <- x$getInverse()
        # Retrives the most recent value for the inverse
        
        if(!is.null(In)){
                message("Getting cached data")
                return(In)
                # If the value of Inverse is NOT null (was previously calculated), cacheSolve returns that value        
        }
        # If the value of Inverse is NULL, then you retrive matrix x and calculate the inverse with the solve() function
        message("Calculating afresh")
        data <- x$get()
        In <- solve(data, ...)
        x$setInverse(In)
        # Sets Inverse to the newly calculated value   
        In #Returns the new Inverse value
}

## Test Case ##

m <- makeCacheMatrix() ## Initialize matrix
m$set(matrix(1:4,2,2)) ## Set Matrix
m$get() ## Check Matrix 
cacheSolve(m) ## Calculate Inverse afresh
cacheSolve(m)  ## Retrieve from Cache 
