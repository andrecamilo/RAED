#exemplo 1
mu <- 50
stddev <- 1
N <- 10000
pop <- rnorm(N, mean = mu, sd = stddev)
plot(density(pop), main = "Population Density", xlab = "X", ylab = "")


#exemplo 2
n <- 30
samp.means <- rnorm(N, mean = mu, sd = stddev / sqrt(n))
lines(density(samp.means))

#Exemplo 3
mu <- 50
stddev <- 1
N <- 10000
pop <- rnorm(N, mean = mu, sd = stddev)

n <- 30
samp.means <- rnorm(N, mean = mu, sd = stddev / sqrt(n))
max.samp.means <- max(density(samp.means)$y)

plot(density(pop), main = "Population Density",
    ylim = c(0, max.samp.means),
    xlab = "X", ylab = "")
lines(density(samp.means))



#Outros exemplos
A <- c(1, 2, 3, 4, 5)

B <- c(6,7,8,9,10)

# media dos elementos de A
mean(A)

#desvio padrão
sd(A)

#minimos e maximos
min(A)
max(B)

clima

plot(A, B)

?plot