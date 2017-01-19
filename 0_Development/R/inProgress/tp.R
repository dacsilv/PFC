rm(list=ls())

# Teste deteccao borda

# numero de testes
repeticoes <- 10
# numero de pontos
n<-1000

# ligar/desligar cada algoritmo do teste
alg1 <- 1   # algoritmo original
alg2 <- 1   # convex hull 2d
alg3 <- 1   # convex hull n-dimensional
alg4 <- 1   # kde

# bibliotecas
library(birch)
library("flexclust")
library("lattice")
library("fpc")
library(mlbench)
library(clusterCrit)
library(stargazer)
library(BioPhysConnectoR)
library(pdist)
library(plyr)
library(mcclust)
library(ggplot2)
library(gdata)
library(mlbench)
library(clusterSim)
library(caret)

# algoritmos
source('border.R')
source('border_conv2d.R')
source('border_conv.R')
source('border_kde.R')

# criar dados
radius<-0.08
stm<-shapes.circles3(n)
z<-data.frame(stm$data, classes=stm$clusters)
z<-data.matrix(z[,1:2])

# agrupamento BIRCH
birchObj <- birch(z, radius)
plot(birchObj)

# adicionar label para cada agrupamento
N = dim(z)[1]
M = dim(z)[2]
z_label = 1:M
nelipses <- length(birchObj[[1]])
for(i in 1:nelipses) z_label[birchObj[[4]][[i]]] <- i
z_labeled <- cbind(z,z_label)

# rodar cada algoritmo multiplas vezes e medir tempo

# border original
alg1.time <- 0
# convex hull 2d
alg2.time <- 0
# convex hull n dimensoes
alg3.time <- 0
# kde - estimativa de densidade
alg4.time <- 0

for (i in 1:repeticoes)
{
  if(alg1){
    start.time <- Sys.time()
    return <- border(z_labeled)
    end.time <- Sys.time()
    alg1.time <- alg1.time + end.time - start.time
  }
  
  if(alg2){
    start.time <- Sys.time()
    return <- border_conv2d(z_labeled)
    end.time <- Sys.time()
    alg2.time <- alg2.time + end.time - start.time
  }
  
  if(alg3){
    start.time <- Sys.time()
    return <- border_conv(z_labeled)
    end.time <- Sys.time()
    alg3.time <- alg3.time + end.time - start.time
  }
  
  if(alg4){
    start.time <- Sys.time()
    return <- border_kde(z_labeled)
    end.time <- Sys.time()
    alg4.time <- alg4.time + end.time - start.time
  }
  
  
}
alg1medio.time <- alg1.time / repeticoes
alg2medio.time <- alg2.time / repeticoes
alg3medio.time <- alg3.time / repeticoes
alg4medio.time <- alg4.time / repeticoes

if(alg1) cat('Tempo medio para border: ', alg1medio.time, ' segundos \n\r')
if(alg2) cat('Tempo medio para border_conv2d: ', alg2medio.time, ' segundos \n\r')
if(alg3) cat('Tempo medio para border_conv: ', alg3medio.time, ' segundos \n\r')
if(alg4) cat('Tempo medio para border_kde: ', alg4medio.time, ' segundos \n\r')