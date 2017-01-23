## Subsetting
#
#There are a number of operators that can be used to extract subsets of R objects.
#- `[` always returns an object of the same class as the original; can be used to select more than one element (there is one exception)
#
#- `[[` is used to extract elements of a list or a data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
#
#- `$` is used to extract elements of a list or data frame by name; semantics are similar to that of `[[`.
#
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x > "a"]
u <- x > "a"
u
x[u]

x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]

x[1, ]
x[, 2]


## Subsetting a Matrix
x <- matrix(1:6, 2, 3)
x[1, 2]
x[1, 2, drop = FALSE]


## Subsetting a Matrix
x <- matrix(1:6, 2, 3)
x[1, ]
x[1, , drop = FALSE]

## Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]
$bar


## Subsetting Lists
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]
$foo
$baz

## Subsetting Lists
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]  ## computed index for ‘foo’
x$name     ## element ‘name’ doesn’t exist!
x$foo

## Subsetting Nested Elements of a List
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]

## Partial Matching
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]


## Removing NA Values
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

## Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]


## Removing NA Values
airquality[1:6, ]
good <- complete.cases(airquality)

