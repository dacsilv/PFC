x <- mvrnorm(2000, mu=rep(0,5), Sigma=diag(1,5))
x <- rbind(x, mvrnorm(2000, mu=rep(10,5), Sigma=diag(0.1,5)+0.9))
evaluateRadius(x, 0.8, 'mvnorm')

n = 10000
data <- mlbench.spirals(n)
x <- data$x
evaluateRadius(x, 0.01, 'spirals')


data <- mlbench.cassini(n)
x <- data$x
evaluateRadius(x, 0.01, 'cassini')

n <- 3000
data <- mlbench.threenorm(n)
x <- data$x
evaluateRadius(x, 1, 'threenorm')
