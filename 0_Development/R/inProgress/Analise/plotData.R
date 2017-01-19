library(MASS)
library(ellipse)
library(birch)
library(mlbench)

n = 10000
data <- mlbench.cassini(n)
plot(data,main = 'cassini')

x <- mvrnorm(500, mu=rep(0,5), Sigma=diag(1,5))
x <- rbind(x, mvrnorm(500, mu=rep(10,5), Sigma=diag(0.1,5)+0.9))
plot(x,main = 'mvrnorm')

n = 10000
data <- mlbench.spirals(n)
plot(data,main = 'spirals')