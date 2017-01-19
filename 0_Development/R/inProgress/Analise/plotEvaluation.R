library(MASS)
library(ellipse)
library(birch)
library(mlbench)

plotEvaluation <- function(dataName, data, hSilverman){
  title = paste(dataName, " h de Silverman = ", sep = "")
  plot(data$radius, data$intCrit, main = paste(title,hSilverman,sep = ""))
}
SilvCassini = 0.0824235713143183
plotEvaluation('Cassini',cassini,SilvCassini)


Silvmvnorm = 1.02607785760761
plotEvaluation('mvnorm',mvnorm6,Silvmvnorm)



SilvSpirals <- 0.0824235713143183

plotEvaluation('spirals',spirals, SilvSpirals)
