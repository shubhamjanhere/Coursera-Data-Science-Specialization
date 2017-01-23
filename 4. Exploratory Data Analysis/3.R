pData <- read.csv(gzfile("ss06pid.csv.gz"))

## Boxplots
#Important parameters: _col_, _varwidth_, _names_, _horizontal_
boxplot(pData$AGEP, col="blue")


## Boxplots
pData <- transform(pData, DDRS = factor(DDRS))
boxplot(AGEP ~ DDRS, data = pData, col = "blue")


## Boxplots
boxplot(AGEP ~ DDRS, data = pData, col = c("blue", "orange"), names = c("yes", "no"), varwidth = TRUE)


## Barplots
barplot(table(pData$CIT), col = "blue")


## Histograms
hist(pData$AGEP, col = "blue")


## Histograms
hist(pData$AGEP, col = "blue", breaks = 100, main = "Age")


## Density plots
dens <- density(pData$AGEP)
plot(dens, lwd = 3, col = "blue")


## Density plots - multiple distributions
dens <- density(pData$AGEP)
densMales <- density(pData$AGEP[which(pData$SEX == 1)])
plot(dens, lwd = 3, col = "blue")
lines(densMales, lwd = 3, col = "orange")

## Scatterplots
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue")


## Scatterplots - plotting symbol size
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)


## Scatterplots - using color
plot(pData$JWMNP,pData$WAGP,pch=19,col=pData$SEX,cex=0.5)


## Scatterplots - using size
percentMaxAge <- pData$AGEP/max(pData$AGEP)
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=percentMaxAge*0.5)


## Scatterplots - overlaying lines/points
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)
lines(rep(100,dim(pData)[1]),pData$WAGP,col="grey",lwd=5)
points(seq(0,200,length=100),seq(0,20e5,length=100),col="red",pch=19)


## Scatterplots - numeric variables as factors
library(Hmisc)
ageGroups <- cut2(pData$AGEP,g=5)
plot(pData$JWMNP,pData$WAGP,pch=19,col=ageGroups,cex=0.5)


## If you have a lot of points
x <- rnorm(1e5)
y <- rnorm(1e5)
plot(x,y,pch=19)


## If you have a lot of points - sampling
x <- rnorm(1e5)
y <- rnorm(1e5)
sampledValues <- sample(1:1e5,size=1000,replace=FALSE)
plot(x[sampledValues],y[sampledValues],pch=19)


## If you have a lot of points - smoothScatter
x <- rnorm(1e5)
y <- rnorm(1e5)
smoothScatter(x,y)


## If you have a lot of points - hexbin {hexbin}
library(hexbin)
x <- rnorm(1e5)
y <- rnorm(1e5)
hbo <- hexbin(x,y)
plot(hbo)


## QQ-plots
x <- rnorm(20); y <- rnorm(20)
qqplot(x,y)
abline(c(0,1))


## Matplot and spaghetti
X <- matrix(rnorm(20*5),nrow=20)
matplot(X,type="b")


## Heatmaps

## Heatmaps - matching intuition
newMatrix <- as.matrix(pData[1:10,161:236])
newMatrix <- t(newMatrix)[,nrow(newMatrix):1]
image(161:236, 1:10, newMatrix)


## Maps - very basics 
library(maps)
map("world")
lat <- runif(40,-180,180); lon <- runif(40,-90,90)
points(lat,lon,col="blue",pch=19)


## Missing values and plots
x <- c(NA,NA,NA,4,5,6,7,8,9,10)
y <- 1:10
plot(x,y,pch=19,xlim=c(0,11),ylim=c(0,11))


## Missing values and plots
x <- rnorm(100)
y <- rnorm(100)
y[x < 0] <- NA
boxplot(x ~ is.na(y))
