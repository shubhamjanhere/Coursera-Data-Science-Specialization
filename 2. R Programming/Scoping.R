lm <- function(x) { x * x }
lm

search()

f <- function(x, y) {
        x^2 + y / z
}

make.power <- function(n) {
        pow <- function(x) {
                x^n 
        }
        pow 
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

## Exploring a Function Closure
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))


## Lexical vs. Dynamic Scoping
y <- 10

f <- function(x) {
        y <- 2
        y^2 + g(x)
}

g <- function(x) { 
        x*y
}
f(3)

g <- function(x) { a <- 3
+ x+a+y 
+ }
g(2)
#Error in g(2) : object "y" not found
y <- 3
g(2)

make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
        params <- fixed
        function(p) {
                params[!fixed] <- p
                mu <- params[1]
                sigma <- params[2]
                a <- -0.5*length(data)*log(2*pi*sigma^2)
                b <- -0.5*sum((data-mu)^2) / (sigma^2)
                -(a + b)
        } 
}

set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL
function(p) {
                params[!fixed] <- p
                mu <- params[1]
                sigma <- params[2]
                a <- -0.5*length(data)*log(2*pi*sigma^2)
                b <- -0.5*sum((data-mu)^2) / (sigma^2)
                -(a + b)
        }
ls(environment(nLL))

## Estimating Parameters

optim(c(mu = 0, sigma = 1), nLL)$par

nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

## Plotting the Likelihood
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
