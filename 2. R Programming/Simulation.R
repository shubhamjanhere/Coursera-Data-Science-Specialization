## Generating Random Numbers
#Functions for probability distributions in R
#- `rnorm`: generate random Normal variates with a given mean and standard deviation
#- `dnorm`: evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
#- `pnorm`: evaluate the cumulative distribution function for a Normal distribution 
#- `rpois`: generate random Poisson variates with a given rate


## Generating Random Numbers
#
#Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
# `d` for density
# `r` for random number generation 
# `p` for cumulative distribution
# `q` for quantile function

dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

x <- rnorm(10) 
x
x <- rnorm(10, 20, 2) 
summary(x)

set.seed(1)
rnorm(5)
set.seed(1)
rpois(10, 1)
rpois(10, 20)
ppois(2, 2)  ## Cumulative distribution
ppois(6, 2)

## Generating Random Numbers From a Linear Model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

## Generating Random Numbers From a Linear Model
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)


## Generating Random Numbers From a Linear Model

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)  ## permutation
sample(1:10, replace = TRUE)  ## Sample w/replacement
 [1] 2 9 7 8 2 8 5 9 7 8