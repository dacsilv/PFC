library(clusterCrit)
library(MASS)
library(birch)
library(ellipse)
set.seed(1234)
x <- mvrnorm(1e4, mu=rep(0,5), Sigma=diag(1,5))
x <- rbind(x, mvrnorm(1e4, mu=rep(10,5), Sigma=diag(0.1,5)+0.9))
plot(x)
dev.new()
## Create birch object
N<-dim(x)[1]
h <-1.06*sd(x)*N^(-1/4)
birchObj <- birch(x, h, keeptree = TRUE)
plot(birchObj)
birchTree = birch.getTree(birchObj)
label<- matrix(1, nrow = nrow(x), ncol=1)
for (i in 1:length(birchTree)){
	members = birchTree[i]$members
	for(j in 1:length(members)){
		label[members[[j]],]= i
	}
}
intCriteria(x, as.integer(label), "all")

