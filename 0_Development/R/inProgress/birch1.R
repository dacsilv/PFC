####  Declaring the libraries ####

library(MASS)
library(ellipse)
library(birch)

################################


####  Getting Data ####
setwd("~/Dropbox/PFC/BIRCH/DATA")
source("~/Dropbox/PFC/BIRCH/DATA")
mydata = read.table("birch1.txt")  
