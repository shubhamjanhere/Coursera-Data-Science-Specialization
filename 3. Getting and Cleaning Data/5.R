## The goal is tidy data

## Start with reshaping
library(reshape2)
head(mtcars)


## Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)


## Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData


## Averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)


## Another way - split
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns


## Another way - apply
sprCount = lapply(spIns,sum)
sprCount


## Another way - combine
unlist(sprCount)
sapply(spIns,sum)


## Another way - plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))


## Creating a new variable
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)


## Peer review experiment data


## Peer review data
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="reviews.csv",method="curl")
download.file(fileUrl2,destfile="solutions.csv",method="curl")
reviews = read.csv("reviews.csv"); solutions <- read.csv("solutions.csv")
head(reviews,2)
head(solutions,2)
     
     
## Merging data - merge()
names(reviews)
names(solutions)
     
     
## Merging data - merge()
mergedData = merge(reviews,solutions,by.x = "solution_id",by.y = "id",all = TRUE)
head(mergedData)
     
     
## Default - merge all common column names
intersect(names(solutions), names(reviews))
mergedData2 = merge(reviews, solutions, all = TRUE)
head(mergedData2)
     
     
## Using join in the plyr package
df1 = data.frame(id = sample(1:10), x = rnorm(10))
df2 = data.frame(id = sample(1:10), y = rnorm(10))
arrange(join(df1, df2), id)
     
     
## If you have multiple data frames
df1 = data.frame(id = sample(1:10), x = rnorm(10))
df2 = data.frame(id = sample(1:10), y = rnorm(10))
df3 = data.frame(id = sample(1:10), z = rnorm(10))
dfList = list(df1, df2, df3)
join_all(dfList)
     