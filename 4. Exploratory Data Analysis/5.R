## Lattice Functions
#
# `xyplot`: this is the main function for creating scatterplots 
# `bwplot`: box-and-whiskers plots (???boxplots???)
# `histogram`: histograms
# `stripplot`: like a boxplot but with actual points 
#- `dotplot`: plot dots on "violin strings"
#- `splom`: scatterplot matrix; like `pairs` in base plotting system 
#- `levelplot`, `contourplot`: for plotting "image" data

## Simple Lattice Plot
library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

## Simple Lattice Plot
library(datasets)
library(lattice)
## Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month)) 
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))


## Lattice Behavior
p <- xyplot(Ozone ~ Wind, data = airquality)  ## Nothing happens!
print(p)  ## Plot appears
xyplot(Ozone ~ Wind, data = airquality)  ## Auto-printing


## Lattice Panel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x+ rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))  ## Plot with 2 panels


## Lattice Panel Functions
## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
  panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median
})


## Lattice Panel Functions: Regression line
## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)  ## First call default panel function
  panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
})


## Many Panel Lattice Plot
library(lattice)
env <- readRDS("maacs_env.rds")
env <- transform(env, MxNum = factor(MxNum))
xyplot(log2(airmus) ~ VisitNum | MxNum, data = env, strip = FALSE, pch = 20, xlab = "Visit Number", ylab = expression(Log[2] * " Airborne Mouse Allergen"), main = "Mouse Allergen and Asthma Cohort Study (Baltimore City)")
