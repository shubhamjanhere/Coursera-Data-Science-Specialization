## tapply - `tapply` is used to apply a function over subsets of a vector. I don’t know why it’s called `tapply`.

str(tapply)
function (X, INDEX, FUN = NULL, ..., simplify = TRUE)


## tapply
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)

## tapply
tapply(x, f, mean, simplify = FALSE)
$‘1‘
$‘2‘
$‘3‘

tapply(x, f, range)
$‘1‘
$‘2‘
$‘3‘


## split
str(split)
function (x, f, drop = FALSE, ...)

## split
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
$‘1‘
$‘2‘
$‘3‘

lapply(split(x, f), mean)
$‘1‘
$‘2‘
$‘3‘

## Splitting a Data Frame
library(datasets)
head(airquality)

## Splitting a Data Frame
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
$‘5‘
$‘6‘
$‘7‘

## Splitting a Data Frame
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) 
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

## Splitting on More than One Level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

## Splitting on More than One Level
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))
