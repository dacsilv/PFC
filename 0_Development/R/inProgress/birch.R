## an example
## Create a data set
library(MASS)
library(birch)
set.seed(1234) 
x <- mvrnorm(1e5, mu=rep(0,5), Sigma=diag(1,5))
x <- rbind(x, mvrnorm(1e5, mu=rep(10,5), Sigma=diag(0.1,5)+0.9))

## Create birch object
birchObj <- birch(x, 5, keeptree = TRUE)

## To load directly from a file or connection

## Not run:birchObj <- birch("myfile.csv", 1, sep=",", header=TRUE)## End(Not run)


## Not run:birchObj <- birch("http://www.dot.com/myfile.csv", 1, sep=",",header=TRUE)## End(Not run)


## Leaving a tree in memory
birchObj <- birch(x, 5, keeptree=TRUE)
birch.addToTree(x, birchObj)
birchObj <- birch.getTree(birchObj)
## And don't forget to killTree...
#birch.killTree(birchObj)
