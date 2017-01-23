## Plotting and Color
## colorRamp
colors()

pal <- colorRamp(c("red", "blue"))

#	> pal(0)
#		 [,1] [,2] [,3]
#	[1,]  255    0    0
#
#	> pal(1)
#		 [,1] [,2] [,3]
#	[1,]    0    0  255
#
#	> pal(0.5)
#		  [,1] [,2]  [,3]
#	[1,] 127.5    0 127.5


## colorRamp
pal(seq(0, 1, len = 10))
#                  [,1] [,2]       [,3]
#        [1,] 255.00000    0          0
#        [2,] 226.66667    0   28.33333
#        [3,] 198.33333    0   56.66667
#        [4,] 170.00000    0   85.00000
#        [5,] 141.66667    0  113.33333
#        [6,] 113.33333    0  141.66667
#        [7,]  85.00000    0  170.00000
#        [8,]  56.66667    0  198.33333
#        [9,]  28.33333    0  226.66667
#        [10,]  0.00000    0  255.00000


## colorRampPalette
pal <- colorRampPalette(c("red", "yellow"))

pal(2)

pal(10)


## RColorBrewer Package

library(RColorBrewer)

cols <- brewer.pal(3, "BuGn")

cols

pal <- colorRampPalette(cols)

image(volcano, col = pal(20))
