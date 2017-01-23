
## apply

#`apply` is used to a evaluate a function (often an anonymous one) over the margins of an array.

# It is most often used to apply a function to the rows or columns of a matrix

# It can be used with general arrays, e.g. taking the average of an array of matrices 

# It is not really faster than writing a loop, but it works in one line!


str(apply)
function (X, MARGIN, FUN, ...)


## apply
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

apply(x, 1, sum)

## col/row sums and means

#For sums and means of matrix dimensions, we have some shortcuts.
#
# `rowSums` = `apply(x, 1, sum)`
# `rowMeans` = `apply(x, 1, mean)`
# `colSums` = `apply(x, 2, sum)`
# `colMeans` = `apply(x, 2, mean)`

#The shortcut functions are _much_ faster, but you won’t notice unless you’re using a large matrix.


## Other Ways to Apply

#Quantiles of the rows of a matrix.

x <- matrix(rnorm(200), 20, 10)

apply(x, 1, quantile, probs = c(0.25, 0.75))

#Average matrix in an array

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)

rowMeans(a, dims = 2)
