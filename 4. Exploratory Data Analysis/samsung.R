
## This file must be run in the 
## UCI HAR Dataset/ directory

xvals <- read.table("train/X_train.txt")
yvals <- read.table("train/Y_train.txt")
features <- read.table('features.txt')
subject <- read.table("train/subject_train.txt")


colnames(xvals) <- features[,2]
yvals <- yvals[,1]
yvals[yvals==1]="walk"
yvals[yvals==2]="walkup"
yvals[yvals==3]="walkdown"
yvals[yvals==4]="sitting"
yvals[yvals==5]="standing"
yvals[yvals==6]="laying"

xvals$subject <- subject[,1]
xvals$activity <- yvals

samsungData <- xvals

# save(samsungData,file="samsungData.rda")


###########################################################################
# mad = mean absolute deviation
load("samsungData.rda")
names(samsungData)[1:12]
table(samsungData$activity)
par(mfrow = c(1,2), mar = c(5,4,1,1))
samsungData <- transform(samsungData, activity = factor(activity))
sub1 <- subset(samsungData, subject == 1 )
plot(sub1[,1], col = sub1$activity, ylab = names(sub1)[1])
plot(sub1[,2], col = sub1$activity, ylab = names(sub1)[2])
legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1)

source("myplclust.R")
distanceMatrix <- dist(sub1[,1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

par(mfrow = c(1,2))
plot(sub1[, 10], pch = 19, col = sub1$activity, ylab = names(sub1)[10])
plot(sub1[, 11], pch = 19, col = sub1$activity, ylab = names(sub1)[11])

par(mfrow = c(1,1))
distanceMatrix <- dist(sub1[,10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

# SVD
svd1 = svd(scale(sub1[, -c(562,563)]))
par(mfrow = c(1,2))
plot(svd1$u[, 1], pch = 19, col = sub1$activity)
plot(svd1$u[, 2], pch = 19, col = sub1$activity)

#Clustering based on MAX accelaration
distanceMatrix <- dist(sub1[,10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

# SVD
svd1 = svd(scale(sub1[, -c(562,563)]))
par(mfrow = c(1,2))
plot(svd1$u[, 1], pch = 19, col = sub1$activity)
plot(svd1$u[, 2], pch = 19, col = sub1$activity)

# Find max contributor
plot(svd1$v[,2], pch = 19)

# New Clustering with maximum contributor
maxConrib <- which.max(svd1$v[,2])
distanceMatrix <- dist(sub1[ ,c(10:12,maxConrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

names(samsungData)[maxConrib]

# K means
kClust <- kmeans(sub1[,-c(562,563)], centers = 6)
table(kClust$cluster, sub1$activity)


kClust <- kmeans(sub1[,-c(562,563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)

plot(kClust$center[1, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
plot(kClust$center[2, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
plot(kClust$center[3, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
plot(kClust$center[4, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
plot(kClust$center[5, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
plot(kClust$center[6, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")





