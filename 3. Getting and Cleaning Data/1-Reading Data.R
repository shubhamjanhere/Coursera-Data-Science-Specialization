## Reading data from a file
cameraData <- read.table("cameras.csv", sep = ",", header = TRUE)
head(cameraData)
## Alternate to the above function
cameraData <- read.csv("cameras.csv")
head(cameraData)

##______________________________________________________________________________________
##Reading data from excel file
library(xlsx)
cameraData <- read.xlsx("cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)

## Reading specific rows and columns
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx2("cameras.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex) ## read.xlsx2 is faster
cameraDataSubset


##______________________________________________________________________________________
##Reading data from XML file
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

## Directly access parts of the XML document
rootNode[[1]]
rootNode[[1]][[1]]

## Programatically extract parts of the file
xmlSApply(rootNode,xmlValue)

## Get the items on the menu and prices
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

## Extract content by attributes
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
teams


##______________________________________________________________________________________
## Reading data from JSON {jsonlite package}
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos") #First open this URL in webbrowser in case of Windows
names(jsonData)
jsonData$name

## Nested objects in JSON
names(jsonData$owner)
jsonData$owner$login

## Writing data frames to JSON
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

## Convert back to JSON
iris2 <- fromJSON(myjson)
head(iris2)

##______________________________________________________________________________________
## data.table
# Inherets from data.frame
# All functions that accept data.frame work on data.table
# Written in C so it is much faster
# Much, much faster at subsetting, group, and updating

## Create data tables just like data frames
library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

## See all the data tables in memory
tables()

## Subsetting rows
DT[2,]
DT[DT$y=="a",]

## Subsetting rows
DT[c(2,3)]

## Subsetting columns!?
DT[,c(2,3)]

##______________________________________________________________________________________
## mySQL
## Connecting and listing databases
library(RMySQL)
library(DBI)
ucscDb <- dbConnect(MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); 
dbDisconnect(ucscDb);
result

## Connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(),user="genome", db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

## Get dimensions of a specific table
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

## Read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

## Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10); dbClearResult(query);
dim(affyMisSmall)

## Don't forget to close the connection!
dbDisconnect(hg19)