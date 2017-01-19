

####  Declaring the libraries ####

library(MASS)
library(ellipse)
library(birch)
library(mlbench)

################################
rm(list=ls())
setwd("~/Documents/BIRCH/DATA/")
getwd()
data <- mlbench.circle(n, d=2)

####  Getting Data ####
plot(data)

N <- dim(data$x)[1]
h <-1.06*sd(data$x)*N^(-1/5)
birchObj <- birch(as.matrix(data$x),h, keeptree = TRUE)
plot(birchObj)
