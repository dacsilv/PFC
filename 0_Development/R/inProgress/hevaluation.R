library(MASS)
library(ellipse)
library(birch)
library(mlbench)
library(clusterCrit)


n = 10000
data <- mlbench.spirals(n)

N <- dim(data$x)[1]
h <-1.06*sd(data$x)*N^(-1/5)

step <- 0.04
intCrit<- matrix(0, nrow = 15, ncol=2)
h = 0.04
k = 1
while(h<2){

	birchObj <- birch(as.matrix(data$x), h, keeptree = TRUE)
	birchTree = birch.getTree(birchObj)
	label<- matrix(1, nrow = nrow(as.matrix(data$x)), ncol=1)
	for (i in 1:length(birchTree)){
		members = birchTree[i]$members
		for(j in 1:length(members)){
			label[members[[j]],]= i
		}
	}
	intCrit[k,2]<-intCriteria(as.matrix(data$x), as.integer(label),"silhouette")
	intCrit[k,2] <- h
	h <- h+step;
	k <- k + 1

}

plot(intCrit)
