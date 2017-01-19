library(MASS)
library(ellipse)
library(birch)
library(mlbench)
library(clusterCrit)


n = 20000
data <- mlbench.spirals(n)

####  Getting Data ####
plot(data)

N <- dim(data$x)[1]
h <-1.06*sd(data$x)*N^(-1/4)
birchObj <- birch(as.matrix(data$x), h, keeptree = TRUE)
plot(birchObj)
birchTree = birch.getTree(birchObj)
label<- matrix(1, nrow = nrow(as.matrix(data$x)), ncol=1)
for (i in 1:length(birchTree)){
	members = birchTree[i]$members
	for(j in 1:length(members)){
		label[members[[j]],]= i
	}
}
intCriteria(as.matrix(data$x), as.integer(label), "all")
