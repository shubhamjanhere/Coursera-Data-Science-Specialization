str(mapply)

mapply(rep, 1:4, 4:1)

## Vectorizing a Function
noise <- function(n, mean, sd) {
+ rnorm(n, mean, sd)
+ }
noise(5, 1, 2)
noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)

## Instant Vectorization
list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))
