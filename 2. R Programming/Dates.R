x <- as.Date("1970-01-01")
x

unclass(x)

unclass(as.Date("1970-01-02"))

x <- Sys.time()

p <- as.POSIXlt(x)

p$sec

x <- Sys.time()
x  ## Already in ‘POSIXct’ format
## [1] "2013-01-24 22:04:14 EST"
unclass(x)
## [1] 1359083054
x$sec
## Error: $ operator is invalid for atomic vectors
p <- as.POSIXlt(x)
p$sec
## [1] 14.37

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

## Operations on Dates and Times

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S") 
x-y
## Warning: Incompatible methods ("-.Date",
## "-.POSIXt") for "-"
## Error: non-numeric argument to binary operator
x <- as.POSIXlt(x) 
x-y
## Time difference of 356.3 days


## Operations on Dates and Times

x <- as.Date("2012-03-01") y <- as.Date("2012-02-28") 
x-y
## Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT") 
y-x
## Time difference of 1 hours
