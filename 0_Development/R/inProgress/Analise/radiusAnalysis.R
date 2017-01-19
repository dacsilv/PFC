
library(MASS)
library(ellipse)
library(birch)
library(mlbench)
library(clusterCrit)

evaluateRadius <- function(x,step,dataName){

	N <- dim(x)[1]
	hSilv <-1.06*sd(x)*N^(-1/5)
	filePath = '~/BirchTests/'
	filename = paste(dataName,'.txt',sep = "")
	write.table(paste('h Silverman: ',toString(hSilv)),paste(filePath,filename,sep = "") , row.names= FALSE, col.names = FALSE, sep="\t")
	
	intCrit<- matrix(0, nrow = 15, ncol=1)
	radius <- matrix(0, nrow = 15, ncol=1)

	h = step
	max_it = max(x) + abs(min(x))
	k = 1
	while(h<max_it){

		birchObj <- birch(as.matrix(x), h, keeptree = TRUE)
		birchTree = birch.getTree(birchObj)
		label<- matrix(1, nrow = nrow(as.matrix(x)), ncol=1)
		for (i in 1:length(birchTree)){
			members = birchTree[i]$members
			for(j in 1:length(members)){
				label[members[[j]],]= i
			}
		}
		intCrit[k]<-intCriteria(as.matrix(x), as.integer(label),"silhouette")
		radius[k] <- h
		h <- h+step;
		k <- k + 1

	}
	filename2 = paste(dataName,'.png',sep = "")
	png(file = paste(filePath,filename2,sep = ""))
	plot(radius,intCrit)
	

	lines(radius, intCrit, type="b", lwd=1.5)
	data = cbind(radius,intCrit)
	write.table(data,paste(filePath,filename,sep = "") , row.names=FALSE,append=TRUE, sep="\t")

}
