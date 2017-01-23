log(-1)

## Something’s Wrong
printmessage <- function(x) {
        if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

## Something’s Wrong
printmessage <- function(x) {
          if(x > 0)
                print("x is greater than zero")
          else
                print("x is less than or equal to zero")
          invisible(x)
}
printmessage(1)
printmessage(NA)

## Something’s Wrong!
printmessage2 <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

## Something’s Wrong!
printmessage2 <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}
x <- log(-1)
printmessage2(x)


## Debugging Tools in R
mean(x)
traceback()
lm(y ~ x)

## debug

debug(lm)
lm(y ~ x)

read.csv("nosuchfile")
