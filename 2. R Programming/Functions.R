#f <- function(<arguments>) {
#        ## Do something interesting
#}

## Function Arguments
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

## Argument Matching
args(lm)


## Defining a Function
f <- function(a, b = 1, c = 2, d = NULL) {

}


## Lazy Evaluation

f <- function(a, b) {
        a^2
} 
f(2)

f <- function(a, b) {
        print(a)
        print(b)
}
f(45)

## The “...” Argument

myplot <- function(x, y, type = "l", ...) {
        plot(x, y, type = type, ...)
}

args(paste)

paste("a", "b", sep = ":")