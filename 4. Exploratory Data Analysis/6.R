##ggplot2
library(ggplot2)
str(mpg)


## ggplot2 ???Hello, world!???
qplot(displ, hwy, data = mpg)
#displ = how long engine is 
#hwy = highway milage
#drv = formal drive, front wheel drive (2), rear wheel drive(1)

## Modifying aesthetics
qplot(displ, hwy, data = mpg, color = drv)


## Adding a geom
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
# point means you want to add the points and smooth cooresponds to the blue line that goes across with grey as 95% confidence interval for data


## Histograms
qplot(hwy, data = mpg, fill = drv)


## Facets -> variable on LHS indicate coloumns of panels and var on RHS determine rows, sep. with ~
qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)


## MAACS Cohort- This dataset is not publically available, so I have attached a 
eno <- read.csv("eno.csv")
skin <- read.csv("skin.csv")
env <- read.csv("environmental.csv")
m <- merge(eno, env, by = "id")
maacs <- merge(m, skin, by = "id")

load("maacs.Rda")    #This directly loads maacs dataset which required by script and is incomplete with 5 variables . ##OR               
maacs <- readRDS("maacs_env.Rds") # This dataset is complete with all 27 variables


## Example: MAACS
str(maacs)


## Histogram of eNO
qplot(log(eno), data = maacs)


## Histogram by Group
qplot(log(eno), data = maacs, fill = mopos)


## Density Smooth
qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = mopos)


## Scatterplots: eNO vs. PM$_{2.5}$
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos)


## Scatterplots: eNO vs. PM$_{2.5}$
qplot(log(pm25), log(eno), data = maacs, color = mopos, 
      geom = c("point", "smooth"), method = "lm")


## Scatterplots: eNO vs. PM$_{2.5}$
qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"), 
      method = "lm", facets = . ~ mopos)

####################################################################################################################
####################################################################################################################

## Basic Components of a ggplot2 Plot
# A _data frame_
# _aesthetic mappings_: how data are mapped to color, size 
# _geoms_: geometric objects like points, lines, shapes. 
# _facets_: for conditional plots. 
# _stats_: statistical transformations like binning, quantiles, smoothing. 
# _scales_: what scale an aesthetic map uses (example: male = red, female = blue). 
# _coordinate system_ 


## Building Plots with ggplot2
# When building plots in ggplot2 (rather than using qplot) the ???artist???s palette??? model may be the closest analogy
# Plots are built up in layers
# Plot the data
# Overlay a summary
# Metadata and annotation


## Example: BMI, PM$_{2.5}$, Asthma
# Mouse Allergen and Asthma Cohort Study
# Baltimore children (age 5-17)
# Persistent asthma, exacerbation in past year
# Does BMI (normal vs. overweight) modify the relationship between PM$_{2.5}$ and asthma symptoms?

maacs <- readRDS("maacs_env.Rds")

## Basic Plot
library(ggplot2)
qplot(log(pm25), airnic, data = maacs, 
      geom = c("point", "smooth"), method = "lm")


## Building Up in Layers
head(maacs)
g <- ggplot(maacs, aes(log(pm25), airnic))
summary(g)


## No Plot Yet!
print(g)


## First Plot with Point Layer

g + geom_point()


## Adding More Layers: Smooth
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method = "lm")


## Adding More Layers: Facets
g + geom_point() + facet_grid(. ~ VisitNum) + geom_smooth(method = "lm")


## Annotation
# Labels: `xlab()`, `ylab()`, `labs()`, `ggtitle()`
# Each of the ???geom??? functions has options to modify 
# For things that only make sense globally, use `theme()` 
# Example: `theme(legend.position = "none")` 
# Two standard appearance themes are included
# `theme_gray()`: The default theme (gray background)
# `theme_bw()`: More stark/plain 


## Modifying Aesthetics
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
g + geom_point(aes(color = VisitNum), size = 4, alpha = 1/2)


## Modifying Labels
g + geom_point(aes(color = VisitNum)) + labs(title = "MAACS Cohort") + 
  labs(x = expression("log " * PM[2.5]), y = "AirNic")


## Customizing the Smooth
g + geom_point(aes(color = VisitNum), size = 2, alpha = 1/2) + 
  geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)


## Changing the Theme


## A Note about Axis Limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100  ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()


## Axis Limits
g + geom_line() + ylim(-3, 3)
g + geom_line() + coord_cartesian(ylim = c(-3, 3))


## More Complex Example
# How does the relationship between PM$_{2.5}$ and nocturnal symptoms vary by BMI and NO$_2$?
# Unlike our previous BMI variable, NO$_2$ is continuous
# We need to make NO$_2$ categorical so we can condition on it in the plotting
# Use the `cut()` function for this