## Entering Input
x <- 1
print(x)
x
msg <- "hello"
x <-  ## Incomplete expression

## Evaluation
x <- 5  ## nothing printed
x       ## auto-printing occurs
print(x)  ## explicit printing

## Printing
x <- 1:20 
x

## Creating Vectors
x <- c(0.5, 0.6)       ## numeric
x <- c(TRUE, FALSE)    ## logical
x <- c(T, F)           ## logical
x <- c("a", "b", "c")  ## character
x <- 9:29              ## integer
x <- c(1+0i, 2+4i)     ## complex
x <- vector("numeric", length = 10) 
x

## Mixing Objects

y <- c(1.7, "a")   ## character
y <- c(TRUE, 2)    ## numeric
y <- c("a", TRUE)  ## character

## Explicit Coercion

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

## Explicit Coercion
x <- c("a", "b", "c")
as.numeric(x)
as.complex(x)

## Matrices
m <- matrix(nrow = 2, ncol = 3) 
m
dim(m)
attributes(m)
$dim
m <- matrix(1:6, nrow = 2, ncol = 3) 
m
m <- 1:10 
m
dim(m) <- c(2, 5)
m

## cbind-ing and rbind-ing
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y) 

## Lists
x <- list(1, "a", TRUE, 1 + 4i) 
x

## Factors
x <- factor(c("yes", "yes", "no", "yes", "no")) 
x
table(x) 
x
unclass(x)
attr(,"levels")
x <- factor(c("yes", "yes", "no", "yes", "no"),levels = c("yes", "no"))
x


## Missing Values
x <- c(1, 2, NA, 10, 3)
is.na(x)
x <- c(1, 2, NaN, NA, 4)


## Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x
nrow(x)
ncol(x)

## Names
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf") 
x
names(x)
x <- list(a = 1, b = 2, c = 3) 
x
$a
$b 
$c 
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) 
m
