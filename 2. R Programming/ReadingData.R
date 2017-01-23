data <- read.table("foo.txt")

## Reading in Larger Datasets with read.table
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)
## dput-ting R Objects
y <- data.frame(a = 1, b = "a")
dput(y)
structure(list(a = 1,
               b = structure(1L, .Label = "a",
                             class = "factor")),
          .Names = c("a", "b"), row.names = c(NA, -1L),
          class = "data.frame")
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

## Dumping R Objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R") 
rm(x, y)
source("data.R")
y
x


## Interfaces to the Outside World
str(file)
function (description = "", open = "", blocking = TRUE,
          encoding = getOption("encoding"))

		  
## Connections
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
data <- read.csv("foo.txt")

## Reading Lines of a Text File
con <- gzfile("words.gz") 
x <- readLines(con, 10) 
x

## Reading Lines of a Text File
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
